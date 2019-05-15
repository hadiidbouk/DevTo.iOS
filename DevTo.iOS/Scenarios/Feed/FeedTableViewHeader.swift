//
//  FeedTableViewHeader.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/15/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class FeedTableViewHeader : UIView {
    
    init() {
        
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI
extension FeedTableViewHeader {
    
    private func setupUI() {
        
        backgroundColor = .white
        
        setupLeftImageView()
        setupRightImageView()
        setupFeedFilterButton()
    }
    
    private func setupLeftImageView() {
        
        let leftImageViewContainer = UIView()
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = #imageLiteral(resourceName: "nav-button-left")
        
        leftImageViewContainer.addSubview(leftImageView)
        leftImageView.apply {
            $0.topConstraint(constant: 15)
            $0.leadingConstraint(constant: 20)
            $0.widthConstraint(constant: 25)
            $0.heightConstraint(constant: 25)
        }
        
        addSubview(leftImageViewContainer)
        leftImageViewContainer.apply {
            $0.topConstraint(constant: 0)
            $0.leadingConstraint(constant: 0)
            $0.widthConstraint(constant: 65)
            $0.bottomConstraint(constant: 0)
        }
    }
    
    private func setupRightImageView() {
        
        let rightImageViewContainer = UIView()
        let rightImageView = UIImageView()
        rightImageView.contentMode = .scaleAspectFit
        rightImageView.image = #imageLiteral(resourceName: "nav-button-right")
        
        rightImageViewContainer.addSubview(rightImageView)
        rightImageView.apply {
            $0.topConstraint(constant: 15)
            $0.trailingConstaint(constant: -20)
            $0.widthConstraint(constant: 25)
            $0.heightConstraint(constant: 25)
        }
        
        addSubview(rightImageViewContainer)
        rightImageViewContainer.apply {
            $0.topConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
            $0.widthConstraint(constant: 65)
            $0.bottomConstraint(constant: 0)
        }
    }
    
    private func setupFeedFilterButton() {
        let feedTypeButton = UIButton(type: .system)
        feedTypeButton.setTitle(FeedType.myDevFeed.rawValue, for: .normal)
        feedTypeButton.setTitleColor(.black, for: .normal)
        feedTypeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        addSubview(feedTypeButton)
        feedTypeButton.apply {
            $0.centerToParentHorizontal()
            $0.topConstraint(constant: 0)
            $0.bottomConstraint(constant: 0)
        }
    }
}
