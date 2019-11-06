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

    
     let dataModel = DataModel()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
         let tabBarController = window!.rootViewController as! UITabBarController
         let navViewController = tabBarController.viewControllers![0] as! UINavigationController
         let masterViewController = navViewController.viewControllers[0] as! MasterViewController
        
         masterViewController.dataModel = dataModel
        
        
        let tehillimNavController = tabBarController.viewControllers![1] as! UINavigationController
        _ = tehillimNavController.viewControllers[0] as! TehillimTableViewController
        
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

