//
//  FeedViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    //UI
    var navigationBarView: NavigationBarView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

//MARK: - UI
extension FeedViewController {
    
    private func setupUI() {
        
        setupNavigationBarView()
    }
    
    private func setupNavigationBarView() {
        navigationBarView = NavigationBarView()
        navigationBarView.setToTop(view: view)
    }
}
