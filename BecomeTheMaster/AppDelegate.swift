//
//  AppDelegate.swift
//  BecomeTheMaster
//
//  Created by Picturesque on 2021/01/30.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        //Exception Error Handler
        NSSetUncaughtExceptionHandler { exception in
            DEBUG_LOG("exception: \(exception)\nexception.reason: \(exception.reason ?? "")")
           //DEBUG_LOG(exception.callStackSymbols)
        }
        
        return true
    }
}

