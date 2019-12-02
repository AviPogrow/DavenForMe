//
//  AppDelegate.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    let dataModel = DataModel()
        
       let tehillimDataModel = TehillimDataModel()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            guard
            // The window's root vc
            // let tabBarController = window!.rootViewController as? UITabBarController,
        
            // inside the Tab we have a split vc
            //let splitViewController: UISplitViewController  = tabBarController.viewControllers![0] as! UISplitViewController,
                let splitViewController = window!.rootViewController as? UISplitViewController,
            
            let masterNavController = splitViewController.viewControllers.first as? UINavigationController,
            
            let masterViewController = masterNavController.topViewController as? MasterViewController,
        
            let nameDetailNavController = splitViewController.viewControllers.last as? UINavigationController,
            let nameDetailViewController = (splitViewController.viewControllers.last as?
            UINavigationController)?.topViewController as?
                NameDetailViewController
            
            else {fatalError() }
            
            // flip the semantic content attributes
            splitViewController.view.semanticContentAttribute = .forceRightToLeft
            // pushes it right to left
            masterNavController.view.semanticContentAttribute = .forceRightToLeft
            
            // flips the bar buttons like "edit" and "+"
            masterNavController.navigationBar.semanticContentAttribute = .forceRightToLeft
        
          // flips the back button and the share button
          nameDetailNavController.navigationBar.semanticContentAttribute = .forceRightToLeft
                   
            
            masterViewController.dataModel = dataModel
            
            // add the "Mispalelis" to the back arrow
            masterViewController.title = "Mispalelis"
            
            masterViewController.delegate = nameDetailViewController
            
        //nameDetailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        
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

