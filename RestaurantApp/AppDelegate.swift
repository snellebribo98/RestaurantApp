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
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication)
    {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        
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



