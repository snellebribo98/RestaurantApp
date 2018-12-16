//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Brian van de Velde on 03-12-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?
    var orderTabBarItem: UITabBarItem!
    
    @objc func updateOrderBadge()
    {
        switch MenuController.shared.order.menuItems.count
        {
            case 0:
                orderTabBarItem.badgeValue = nil
            case let count:
                orderTabBarItem.badgeValue = String(count)
        }
    }
    
    // calls the load and saved method in MenuController
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        MenuController.shared.loadOrder()
        MenuController.shared.loadItems()
        
        MenuController.shared.loadRemoteData()
        
        return true
    }
    
    // archived state
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool
    {
        return true
    }
    
    // decides if the archived state is incomaptible with the current version of the app
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool
    {
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let temporaryDirectory = NSTemporaryDirectory()
        let urlCache = URLCache(memoryCapacity: 25_000_000, diskCapacity: 50_000_000, diskPath: temporaryDirectory)
        URLCache.shared = urlCache
        
        NotificationCenter.default.addObserver(self, selector:
        #selector(updateOrderBadge), name:
        MenuController.orderUpdatedNotification, object: nil)
        
        orderTabBarItem = (self.window!.rootViewController! as!
        UITabBarController).viewControllers![1].tabBarItem
        
        updateOrderBadge()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication)
    {
        
    }

    // saves the order when app is in background
    func applicationDidEnterBackground(_ application: UIApplication)
    {
        MenuController.shared.saveOrder()
        MenuController.shared.saveItems()
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        
    }


}



