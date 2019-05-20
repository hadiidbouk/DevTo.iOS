//
//  ArticleDetailsViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleDetailsViewController: BaseViewController {

    var bottomView: ArticleDetailsBottomView!
    var rootStackView: UIStackView!
    var coverImageView: UIImageView!
    var scrollView: UIScrollView!
    
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
        setupRootStackView()
    }
    
    private func setupBottomView() {
        bottomView = ArticleDetailsBottomView()
        bottomView.setToBottom(view: view)
    }
    
    private func setupRootStackView() {
        
        scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(scrollView)
        scrollView.apply {
            $0.topConstraint(onBottomOf: navigationBarView, constant: 1)
            $0.bottomConstraint(onTopOf: bottomView, constant: -1)
            $0.leadingConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
        }
        
        rootStackView = UIStackView()
        rootStackView.axis = .vertical
        rootStackView.distribution = .fill
        rootStackView.spacing = 5
        
        scrollView.addSubview(rootStackView)
        rootStackView.apply {
            $0.stickToParentEdges()
            $0.widthConstraint(sameAs: scrollView)
        }
        
        setupCoverImageView()
    }
    
    private func setupCoverImageView() {
        
        let coverImageViewContainer = UIView()
        coverImageView = UIImageView()
        coverImageView.contentMode = .scaleToFill
        coverImageView.kf.setImage(with: URL(string: "https://res.cloudinary.com/practicaldev/image/fetch/s--wd9i1HhS--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/http://i.imgur.com/LNs7k41.png")!)
        
        coverImageViewContainer.addSubview(coverImageView)
        coverImageView.apply {
            $0.stickToParentEdges()
        }
        
        rootStackView.addArrangedSubview(coverImageViewContainer)
        
        coverImageViewContainer.apply {
            $0.aspectRatioConstraint(multiplier: 9/21)
        }
    }
}
