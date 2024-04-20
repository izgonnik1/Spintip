//
//  AppDelegate.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import Foundation
import UIKit

/// AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("App Started")
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("App terminated")
    }
}
