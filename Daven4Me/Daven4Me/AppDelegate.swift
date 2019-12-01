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
     
    let tehillimDataModel = TehillimDataModel()
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // The window's root vc
         let tabBarController = window!.rootViewController as! UITabBarController
        
        //tabBarController.view.semanticContentAttribute = .forceRightToLeft
        
        // inside the Tab we have a split vc
        let splitVC: UISplitViewController  = tabBarController.viewControllers![0] as! UISplitViewController
        
        splitVC.view.semanticContentAttribute = .forceRightToLeft
        
        // split vc first vc is Nav controller wrapping the master
        let masterNavController = splitVC.viewControllers.first as! UINavigationController
        
        masterNavController.view.semanticContentAttribute = .forceRightToLeft
        
        // Master View Controller
        let masterViewController =  masterNavController.topViewController as! MasterViewController
        
         masterViewController.dataModel = dataModel
      
        
        let nameDetailNavController = splitVC.viewControllers.last as! UINavigationController
        
        nameDetailNavController.view.semanticContentAttribute = .forceRightToLeft
        
        let nameDetailViewController = nameDetailNavController.topViewController as! NameDetailViewController
        
        nameDetailViewController.view.semanticContentAttribute = .forceRightToLeft
        
         nameDetailViewController.navigationItem.rightBarButtonItem = splitVC.displayModeButtonItem
        
          masterViewController.splitViewDetail = nameDetailViewController
        
        
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

