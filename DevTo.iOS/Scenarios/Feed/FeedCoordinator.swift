//
//  FeedCoordinator.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit
import RxSwift

class FeedCoordinator: Coordinator {
    
    private let disposeBag = DisposeBag()
    
    private let presenter: UINavigationController
    private var feedViewController: FeedViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        
    }
    
    func start() {
        let feedViewController = FeedViewController()
        presenter.pushViewController(feedViewController, animated: false)
        
        self.feedViewController = feedViewController
        
        subscribeToEvents()
    }
    
    private func subscribeToEvents() {
        if let viewModel = feedViewController?.viewModel {
            
            viewModel.showDetails.subscribe(onNext: { [weak self] id in
                self?.showDetails(id: id)
            }).disposed(by: disposeBag)
        }
    }
    
    /**
     Shows the article details in a separate modal screen
     
     - Parameter id: is the article id
     */
    func showDetails(id: Int) {
        let articleDetailsCoordinator = ArticleDetailsCoordinator(presenter: presenter)
        articleDetailsCoordinator.start()
    }
}
