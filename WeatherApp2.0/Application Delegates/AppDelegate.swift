//
//  AppDelegate.swift
//  WeatherApp2.0
//
//  Created by waheedCodes on 11/03/2024.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(">> Launching with real app delegate")
        UINavigationBar
            .appearance()
            .largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Bold", size: 32)!,
                NSAttributedString.Key.foregroundColor: UIColor.WA.primary.color
            ]
        
        return true
    }
}
