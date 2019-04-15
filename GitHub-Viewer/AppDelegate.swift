//
//  AppDelegate.swift
//  GitHub-Viewer
//
//  Created by Yan Meneguelli on 13/04/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.SetupViewInicial()
        return true
    }
    
    func SetupViewInicial(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MySearchGitHub())
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray,NSAttributedString.Key.font: UIFont.systemFont(ofSize:16, weight: .light)]
        window?.makeKeyAndVisible()
    }
}

