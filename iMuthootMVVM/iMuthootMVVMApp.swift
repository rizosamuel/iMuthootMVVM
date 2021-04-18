//
//  iMuthootMVVMApp.swift
//  iMuthootMVVM
//
//  Created by Rijo Samuel on 15/04/21.
//

import SwiftUI

@main
struct iMuthootMVVMApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                // .colorScheme(.light)
        }
    }
}

// App Delegate class for conventional lifecycle capturing
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        NetworkManager.shared.startMonitoring()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        NetworkManager.shared.stopMonitoring()
    }
}
