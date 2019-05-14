//
//  FeedCoordinator.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class FeedCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var feedViewController: FeedViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let feedViewController = FeedViewController()
        presenter.pushViewController(feedViewController, animated: false)
        
        self.feedViewController = feedViewController
    }
}
