//
//  PadeLifeApp.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/01.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
#if RELEASE
        let resource = "GoogleService-Info"
#elseif STAGING
        let resource = "GoogleService-Info-stg"
#else
        let resource = "GoogleService-Info-stg"
#endif
        
        if let filePath = Bundle.main.path(forResource: resource, ofType: "plist") {
            guard let options = FirebaseOptions(contentsOfFile: filePath) else {
                assert(false, "Could not load config file.")
            }
            FirebaseApp.configure(options: options)
        } else {
            FirebaseApp.configure()
        }
        return true
    }
}

@main
struct PadeLifeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
