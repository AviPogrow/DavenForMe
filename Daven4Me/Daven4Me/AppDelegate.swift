//
//  AppDelegate.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {


    var window: UIWindow?
    
    let dataModel = DataModel()
        
    let tehillimDataModel = TehillimDataModel()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            guard
            
            let splitViewController = window!.rootViewController as? UISplitViewController,
            
            let masterNavController = splitViewController.viewControllers.first as? UINavigationController,
            
            let masterViewController = masterNavController.topViewController as? MasterViewController,
        
            let nameDetailNavController = splitViewController.viewControllers.last as? UINavigationController,
            let nameDetailViewController = (splitViewController.viewControllers.last as?
            UINavigationController)?.topViewController as?
                NameDetailViewController
            
            else {fatalError() }
        
        
        splitViewController.delegate = self
            
            // flip the semantic content attributes
            splitViewController.view.semanticContentAttribute = .forceRightToLeft
            // pushes it right to left
            masterNavController.view.semanticContentAttribute = .forceRightToLeft
            
            // flips the bar buttons like "edit" and "+"
            masterNavController.navigationBar.semanticContentAttribute = .forceRightToLeft
        
          // flips the back button and the share button
          nameDetailNavController.navigationBar.semanticContentAttribute = .forceRightToLeft
        nameDetailNavController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        nameDetailNavController.topViewController?.navigationItem.leftItemsSupplementBackButton = true
                   
            
            masterViewController.dataModel = dataModel
            
            // add the "Mispalelis" to the back arrow
            masterViewController.title = "Mispalelis"
            
            masterViewController.delegate = nameDetailViewController
            
    
        return true
    }
    
    

    func createArrayOfTehillimChapters() -> [String] {
      
          //load text file as one long string
         let tehillimTextURL = Bundle.main.url(forResource: "Chapter119Plain", withExtension: ".txt")
         
         let textString = try! String(contentsOf: tehillimTextURL!)
         
        
         let splitByChapters = textString.components(separatedBy: ".")
          
          return splitByChapters
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
