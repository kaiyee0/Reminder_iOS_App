//
//  AppDelegate.swift
//  Reminder
//
//  Created by 林楷翊 on 29/03/2017.
//  Copyright © 2017 林楷翊. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //let appDomain = Bundle.main.bundleIdentifier!
        //UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
        // 建立資料表
        let myUserDefaults = UserDefaults.standard
        let dbInit = myUserDefaults.object(forKey: "dbInit") as? Int
        if dbInit == nil {
            let dbFileName = "sqlite3.db"
            let db = SQLiteConnect(file: dbFileName)
            if let myDB = db {
                let result = myDB.createTable("records", columnsInfo: [
                    "id integer primary key autoincrement",
                    "storyContent text",
                    "storyTitle text",
                    "monthDay text",
                    "createDate text",
                    "createTime DateTime"
                    ])
                
                if result {
                    myUserDefaults.set(1, forKey: "dbInit")
                    myUserDefaults.set(dbFileName, forKey: "dbFileName")
                    myUserDefaults.synchronize()
                }
            }
        }
        
        // 設定 UITableViewCell 預設底色
        UITableViewCell.appearance().backgroundColor = UIColor.init(red: 0.88, green: 0.83, blue: 0.73, alpha: 1)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

