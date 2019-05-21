//
//  ArticleDetailsBottomView.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class ArticleDetailsBottomView : UIView {
    
    var contentView: UIView!
    var dotsImageView: UIImageView!
    
    init() {
        
        super.init(frame: .zero)
        
        setupUI()
        setupGestures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setToBottom(view: UIView) {
        view.addSubview(self)
        self.apply {
            $0.leadingConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
            $0.bottomConstraint(constant: 0)
            $0.heightConstraint(constant: 65 + UIScreen.bottomSafeArea)
        }
    }
}

//MARK: - UI
extension ArticleDetailsBottomView {
    
    private func setupUI() {
        backgroundColor = AppColors.navigationBarBackground
        layer.borderColor = AppColors.feedTableViewCellBorderColor?.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
        layer.shadowColor = AppColors.feedTableViewCellShadowColor?.cgColor
        layer.shadowOpacity = 0.2
        
        contentView = UIView()
        addSubview(contentView)
        contentView.apply {
            $0.leadingConstraint(constant: 10)
            $0.topConstraint(constant: 0)
            $0.trailingConstaint(constant: -10)
            $0.bottomConstraint(constant: -UIScreen.bottomSafeArea)
        }
        
        setupDotsView()
        setupActionsStackView()
    }
    
    private func setupDotsView() {
        dotsImageView = UIImageView()
        dotsImageView.image = #imageLiteral(resourceName: "threeDots").withRenderingMode(.alwaysTemplate)
        dotsImageView.contentMode = .scaleAspectFit
        dotsImageView.tintColor = AppColors.grayTextColor
        
        contentView.addSubview(dotsImageView)
        dotsImageView.apply {
            $0.trailingConstaint(constant: -20)
            $0.widthConstraint(constant: 30)
            $0.heightConstraint(constant: 30)
            $0.centerToParentVertical()
        }
    }
    
    private func setupActionsStackView() {
        
        let actionsStackView = UIStackView()
        actionsStackView.axis = .horizontal
        actionsStackView.distribution = .fillEqually
        actionsStackView.spacing = 10
        
        let heartStackView = getIconAndTextStackView(image: #imageLiteral(resourceName: "heart"), text: "281")
        actionsStackView.addArrangedSubview(heartStackView)
        
        let unicornStackView = getIconAndTextStackView(image: #imageLiteral(resourceName: "unicorn"), text: "78")
        actionsStackView.addArrangedSubview(unicornStackView)
        
        let readingListStackView = getIconAndTextStackView(image: #imageLiteral(resourceName: "readingList"), text: "284")
        actionsStackView.addArrangedSubview(readingListStackView)
        
        contentView.addSubview(actionsStackView)
        actionsStackView.apply {
            $0.centerToParentVertical()
            $0.trailingConstaint(onLeadingOf: dotsImageView, constant: -25)
            $0.leadingConstraint(constant: 25)
        }
    }
    
    private func getIconAndTextStackView(image: UIImage, text: String) -> UIStackView {
        
        let imageAndTextStackView = UIStackView()
        imageAndTextStackView.axis = .horizontal
        imageAndTextStackView.distribution = .fillProportionally
        imageAndTextStackView.spacing = 10
        
        let imageView = UIImageView()
        imageView.image = image.addImagePadding(x: 25, y: 25)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = AppColors.articleDetailsBottomViewActionBackground
        imageView.roundedCorners(radius: 24)
        
        imageAndTextStackView.addArrangedSubview(imageView)
        imageView.apply {
            $0.widthConstraint(constant: 48)
            $0.heightConstraint(constant: 48)
        }
        
        let textLbl = UILabel()
        textLbl.text = text
        textLbl.font = UIFont.boldSystemFont(ofSize: 15)
        textLbl.textColor = AppColors.grayTextColor
        
        imageAndTextStackView.addArrangedSubview(textLbl)
        
        return imageAndTextStackView
    }
}

//MARK: - Gestures
extension ArticleDetailsBottomView {
    
    private func setupGestures() {
        
    }
}
