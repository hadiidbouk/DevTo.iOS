//
//  ArticleDetailsCoordinator.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class ArticleDetailsCoordinator : Coordinator {
    
    private let presenter: UINavigationController
    private var articleDetailsViewController: ArticleDetailsViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let articleDetailsViewController = ArticleDetailsViewController()
        presenter.push(viewController: articleDetailsViewController)
        
        self.articleDetailsViewController = articleDetailsViewController
    }
}
