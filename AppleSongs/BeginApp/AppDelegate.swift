//
//  AppDelegate.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        if let window {
            let application: Application = Application(window: window)
            application.runTheApp()
        }
        
        return true
    }
}

