//
//  TestingAppDelegate.swift
//  WeatherApp2.0Tests
//
//  Created by waheedCodes on 25/03/2024.
//

import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print("<< Launching with testing app delegate")
        return true
    }
}
