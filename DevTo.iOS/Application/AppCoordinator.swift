//
//  AppCoordinator.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class AppCoordinator : Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    let feedCoordinator: FeedCoordinator
    
    init(window: UIWindow) {
        
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.setNavigationBarHidden(true, animated: false)
        feedCoordinator = FeedCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        feedCoordinator.start()
        window.makeKeyAndVisible()
    }
}
