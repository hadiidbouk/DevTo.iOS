//
//  ArticleDetailsViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

//MARK: - UI
extension ArticleDetailsViewController {
    
    private func setupUI() {
        setupNavigationBarView()
    }
}
