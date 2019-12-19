//
//  AppDelegate.swift
//  Swift-Sample-BackgroundFetch
//
//  Created by nobuy on 2019/12/17.
//  Copyright © 2019 A10 Lab Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let userDefaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.red
        UINavigationBar.appearance().tintColor = UIColor.white

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()

        userDefaults.register(defaults: ["Log": "date"])
        application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // ----
        // 必要な処理を行う
        // ----

        // 動作チェック用に呼ばれた日時を記録しておく
        let now = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        let currentTime = formatter.string(from: now as Date)
        let rec = userDefaults.object(forKey: "Log") as! String + "\n" + currentTime
        userDefaults.set(rec , forKey: "Log")
        userDefaults.synchronize()
        print(rec)
        completionHandler(UIBackgroundFetchResult.newData)
    }
}

