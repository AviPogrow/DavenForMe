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

     // single data source for names
     let dataModel = DataModel()
    
     let tehillimDataModel  = TehillimDataModel()
    var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
         let tabBarController = window!.rootViewController as! UITabBarController
        let navViewController = tabBarController.viewControllers![0] as! UINavigationController
        
        let masterViewController = navViewController.viewControllers[0] as! MasterViewController
        
        masterViewController.dataModel = dataModel
        
        let tehillimNavController = tabBarController.viewControllers![1] as! UINavigationController
        let tehillimTableViewController = tehillimNavController.viewControllers[0] as! TehillimTableViewController
        
        tehillimTableViewController.tehillimDataModel = tehillimDataModel
     
        for family in UIFont.familyNames.sorted() {
                   let _ = UIFont.fontNames(forFamilyName: family)
                  // print("Family: \(family) Font names: \(names)")
               }
               
        guard UIFont(name: "Symbol", size: UIFont.labelFontSize) != nil else {
                   fatalError("""
               Failed to load the "SBL" font.
               Make sure the font file is included in the project and the font name is spelled correctly.
               """
                   )
               }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
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

