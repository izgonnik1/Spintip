//
//  SpintipApp.swift
//  Spintip
//
//  Created by Igor Zgonnik on 19.04.2024.
//

import SwiftUI

@main

/// Main struct app
struct SpintipApp: App {
    
    /// Adaptop for import AppDelegate to application
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
