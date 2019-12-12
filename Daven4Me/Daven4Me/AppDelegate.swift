//
//  AppDelegate.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {


    var window: UIWindow?
    
    let dataModel = DataModel()
        
    let tehillimDataModel = TehillimDataModel()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            guard
            
        let rootTabController = window?.rootViewController as? UITabBarController,
        let rootNavController = rootTabController.viewControllers?.first as? UINavigationController,
            
        let splitViewController = rootNavController.topViewController as? UISplitViewController,
            
            let masterNavController = splitViewController.viewControllers.first as? UINavigationController,
            
            let masterViewController = masterNavController.topViewController as? MasterViewController,
        
            let nameDetailNavController = splitViewController.viewControllers.last as? UINavigationController,
            let nameDetailViewController = (splitViewController.viewControllers.last as?
            UINavigationController)?.topViewController as?
                NameDetailViewController
            
            else {fatalError() }
        
        
        splitViewController.delegate = self
            
            // Put the master list on right side instead of left
            splitViewController.view.semanticContentAttribute = .forceRightToLeft
        
        // when first appearing show the master list on the right
        splitViewController.preferredDisplayMode = .allVisible
            
            //in compact mode this tells nav controller
            // to push new detail vcs from left to right
           // instead of right to left and adjusts the back button
            masterNavController.view.semanticContentAttribute = .forceRightToLeft
            
            // flips the bar buttons like "edit" and "+"
        masterNavController.navigationBar.semanticContentAttribute = .forceRightToLeft
        
          // flips the back button and the share button
        nameDetailNavController.navigationBar.semanticContentAttribute = .forceRightToLeft
        
            
            masterViewController.dataModel = dataModel
            
            // add the "Mispalelis" to the back arrow
            masterViewController.title = "Mispalelis"
            
            masterViewController.delegate = nameDetailViewController
        
        // back button on leading edge to toggle the masterView Controller
        //nameDetailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        //nameDetailViewController.navigationItem.leftItemsSupplementBackButton = true
 
        return true
    }
    
 
    func applicationWillResignActive(_ application: UIApplication) {
      saveData()
     }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        saveData()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        saveData()
    }
    
    // MARK:- Helper Methods
    func saveData() {
        dataModel.savePeopleToDisk()
    }
}


extension AppDelegate: UISplitViewControllerDelegate {
    
    
    // in a transition to a compact environment should the detail
    // scene be discarded or incorporated?
    // i.e. on a regular iphone don't launch directly into the
    // detail scene
    // In iPhone 6s Plus this affects behavior when rotating
    // from horizontal - regular size to portrait - compact
    //will collapse the detail scene
    // if nothing to show and keep it if something to show
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
       
        guard let topAsDetailController = secondaryAsNavController.topViewController as? NameDetailViewController else { return false }
        
        // if no item is selected there is nothing to
        // display in the detail scene so collapse detail scene
        if topAsDetailController.selectedPerson == nil {
           
            
            // let the detail vc be discarded
            return true
        }
        
        // if there is a person selected then try to incorporate
        // the detail scene in the compact space
        return false
    }
}
