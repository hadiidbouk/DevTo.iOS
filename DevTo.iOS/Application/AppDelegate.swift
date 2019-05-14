//
//  AppDelegate.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/13/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window!)
        
        appCoordinator?.start()
        
        return true
    }
}

