//
//  FeedTableViewCell.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/17/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    var rootStackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViews(article: Article) {
        
    }
}

//MARK: - UI
extension FeedTableViewCell {
    
    func setupUI() {
        
        rootStackView = UIStackView()
        rootStackView.distribution = .fillProportionally
        rootStackView.axis = .vertical
        
        addSubview(rootStackView)
        rootStackView.apply {
            $0.topConstraint(constant: 15)
            $0.trailingConstaint(constant: -15)
            $0.bottomConstraint(constant: -15)
            $0.leadingConstraint(constant: 15)
        }
        
        setImageAndTitleStackView()
    }
    
    private func setImageAndTitleStackView() {
        let imageAndTitleStackView = UIStackView()
        imageAndTitleStackView.axis = .horizontal
        imageAndTitleStackView.distribution = .fill
        imageAndTitleStackView.alignment = .top
        imageAndTitleStackView.spacing = 10
        
        let userImageView = UIImageView()
        userImageView.image = #imageLiteral(resourceName: "dev_icon")
        userImageView.roundedCorners(radius: 20)
        
        imageAndTitleStackView.addArrangedSubview(userImageView)
        userImageView.apply {
            $0.widthConstraint(constant: 40)
            $0.heightConstraint(constant: 40)
        }
        
        let titleLbl = UILabel()
        titleLbl.text = "What do companies expect from Python devs in 2019?"
        titleLbl.font = UIFont.boldSystemFont(ofSize: 18)
        titleLbl.textAlignment = .left
        titleLbl.numberOfLines = 0
        
        imageAndTitleStackView.addArrangedSubview(titleLbl)
        
        
        rootStackView.addArrangedSubview(imageAndTitleStackView)
    }
}
