//
//  FeedTableViewHeader.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/15/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class FeedTableViewHeader : UIView {
    
    //UI
    var leftImageViewContainer: UIView!
    var rightImageViewContainer: UIView!

    private let disposeBag = DisposeBag()

    var leftImageTapGesture: UITapGestureRecognizer!
    var rightImageTapGesture: UITapGestureRecognizer!
    
    init() {
        
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        
        setupUI()
        setupTapGestures()
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
        
        leftImageViewContainer = UIView()
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
        
        rightImageViewContainer = UIView()
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

//MARK: - Tap Gestures
extension FeedTableViewHeader {
    
    private func setupTapGestures() {
        setupLeftImageGesture()
        setupRightImageGesture()
    }
    
    private func setupLeftImageGesture() {
        leftImageTapGesture = UITapGestureRecognizer()
        leftImageViewContainer.addGestureRecognizer(leftImageTapGesture)
        
        leftImageTapGesture.rx.event.bind(onNext: { [weak self] recognizer in
            self?.leftImageViewContainer.alpha = 0.75
            UIView.animate(withDuration: 0.5) {
                self?.leftImageViewContainer.alpha = 1.0
            }
        }).disposed(by: disposeBag)
    }
    
    private func setupRightImageGesture() {
        rightImageTapGesture = UITapGestureRecognizer()
        rightImageViewContainer.addGestureRecognizer(rightImageTapGesture)
        
        rightImageTapGesture.rx.event.bind(onNext: { [weak self] recognizer in
            self?.rightImageViewContainer.alpha = 0.75
            UIView.animate(withDuration: 0.5) {
                self?.rightImageViewContainer.alpha = 1.0
            }
        }).disposed(by: disposeBag)
    }
}
