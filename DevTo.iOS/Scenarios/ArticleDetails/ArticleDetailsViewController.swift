//
//  ArticleDetailsViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: BaseViewController {

    var bottomView: ArticleDetailsBottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

//MARK: - UI
extension ArticleDetailsViewController {
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        setupNavigationBarView()
        setupBottomView()
    }
    
    private func setupBottomView() {
        bottomView = ArticleDetailsBottomView()
        bottomView.setToBottom(view: view)
    }
}
