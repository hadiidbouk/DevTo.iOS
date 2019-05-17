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
    var titleLbl: UILabel!
    var userImageView: UIImageView!
    var nameAndDateContainer: UIView!
    
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
            $0.topConstraint(constant: 20)
            $0.trailingConstaint(constant: -20)
            $0.bottomConstraint(constant: -20)
            $0.leadingConstraint(constant: 20)
        }
        
        setImageAndTitleStackView()
        setNameDateAndTagsStackView()
    }
    
    private func setImageAndTitleStackView() {
        
        let imageAndTitleStackView = UIStackView()
        imageAndTitleStackView.axis = .horizontal
        imageAndTitleStackView.distribution = .fill
        imageAndTitleStackView.alignment = .lastBaseline
        imageAndTitleStackView.spacing = 10
        
        userImageView = UIImageView()
        userImageView.image = #imageLiteral(resourceName: "dev_icon")
        userImageView.roundedCorners(radius: 20)
        
        imageAndTitleStackView.addArrangedSubview(userImageView)
        userImageView.apply {
            $0.widthConstraint(constant: 40)
            $0.heightConstraint(constant: 40)
        }
        
        titleLbl = UILabel()
        titleLbl.text = "What do companies expect from Python devs in 2019?"
        titleLbl.font = UIFont.boldSystemFont(ofSize: 18)
        titleLbl.textAlignment = .left
        titleLbl.numberOfLines = 0
        
        imageAndTitleStackView.addArrangedSubview(titleLbl)
        
        rootStackView.addArrangedSubview(imageAndTitleStackView)
    }
    
    private func setNameDateAndTagsStackView() {
        
        let nameDateTagsStackView = UIStackView()
        nameDateTagsStackView.axis = .vertical
        nameDateTagsStackView.distribution = .fillEqually
        nameDateTagsStackView.spacing = 5
        
        let nameAndDateContainer = UIView()
        nameDateTagsStackView.addArrangedSubview(nameAndDateContainer)
        
        nameAndDateContainer.apply {
            $0.heightConstraint(constant: 28)
        }
        
        let nameAndDateLbl = UILabel()
        nameAndDateLbl.text = "Andrew Stetsenko ・ Apr 23"
        nameAndDateLbl.textColor = .lightGray
        nameAndDateLbl.textAlignment = .left
        nameAndDateLbl.font = nameAndDateLbl.font.withSize(14)
        
        nameAndDateContainer.addSubview(nameAndDateLbl)
        nameAndDateLbl.apply {
            $0.topConstraint(constant: 10)
            $0.trailingConstaint(constant: -15)
            $0.bottomConstraint(constant: 0)
            $0.leadingConstraint(constant: 40 + 10)
        }
        
        let tagListContainer = UIView()
        nameDateTagsStackView.addArrangedSubview(tagListContainer)

        tagListContainer.apply {
            $0.heightConstraint(constant: 28)
        }
        
        let tagListLbl = UILabel()
        tagListLbl.text = "#pyhton #jobsearch #careeradvice #employment"
        tagListLbl.textAlignment = .left
        tagListLbl.font = tagListLbl.font.withSize(14)
        
        tagListContainer.addSubview(tagListLbl)
        tagListLbl.apply {
            $0.topConstraint(constant: -10)
            $0.bottomConstraint(constant: 0)
            $0.leadingConstraint(constant: 40 + 10)
            $0.trailingConstaint(constant: -15)
        }
        rootStackView.addArrangedSubview(nameDateTagsStackView)
    }
}
