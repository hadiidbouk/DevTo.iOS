//
//  FeedTableViewCell.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/17/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit
import Kingfisher

class FeedTableViewCell: UITableViewCell {

    var containerView: UIView!
    var rootStackView: UIStackView!
    var titleLbl: UILabel!
    var userImageView: UIImageView!
    var nameAndDateContainer: UIView!
    var imageAndTitleStackView: UIStackView!
    var reactionsStackView: UIStackView!
    var commentsStackView: UIStackView!
    var tagListLbl: UILabel!
    var nameAndDateLbl: UILabel!
    var timeAgoLbl: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViews(article: Article) {
        
        // title
        titleLbl.text = article.title
        
        // reactions
        reactionsStackView.arrangedSubviews.forEach { view in
            
            if let label = view as? UILabel {
                if article.positiveReactionsCount == 0 {
                    label.isHidden = true
                } else {
                    label.text = "\(article.positiveReactionsCount)"
                    label.isHidden = false
                }
            }
            
            if let imageView = view as? UIImageView {
                if article.positiveReactionsCount == 0 {
                    imageView.isHidden = true
                } else {
                    imageView.isHidden = false
                }
            }
        }
        
        //comments
        commentsStackView.arrangedSubviews.forEach { view in
            if let label = view as? UILabel {
                
                if article.commentsCount == 0 {
                    label.isHidden = true
                } else {
                    label.text = "\(article.commentsCount)"
                    label.isHidden = false
                }
            }
            
            if let imageView = view as? UIImageView {
                if article.commentsCount == 0 {
                    imageView.isHidden = true
                } else {
                    imageView.isHidden = false
                }
            }
        }
        
        // tags
        let tags = article.tagList.map { "#\($0)" }.joined(separator: " ")
        tagListLbl.text = tags
        
        // name and date
        let name = article.user.name
        let format = DateFormatter()
        format.dateFormat = "MMMM dd"
        let formattedDate = format.string(from: article.publishedTimestamp)
        let nameAndDate = "\(name)・\(formattedDate)"
        nameAndDateLbl.text = nameAndDate
        
        // time Ago
        if let timeAgoText = article.publishedTimestamp.getDayIntervalTimeAgo() {
            timeAgoLbl.isHidden = false
            timeAgoLbl.text = "(\(timeAgoText))"
        } else {
            timeAgoLbl.isHidden = true
        }
        
        // userImageView
        if let profileImageUrl = URL(string: article.user.profileImage90Url) {
            
            userImageView.kf.setImage(with: profileImageUrl, options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage
                ])
        }

        //In order to fix dynamic cell heights only correct after some scrolling
        layoutIfNeeded()
        
        self.updateImageAndTitleStackViewAligment(text: article.title)
        
        selectionStyle = .none
    }
    
    //Center titleLbl text if line count equal to 1
    private func updateImageAndTitleStackViewAligment(text: String) {
        let textSize = CGSize(width: titleLbl.frame.size.width, height: CGFloat(Float.infinity))
        let rHeight = Float(titleLbl.sizeThatFits(textSize).height)
        var lineCount:Float = 0
        let charSize = Float(titleLbl.font.lineHeight)
        lineCount = floor(rHeight / charSize)
        
        if lineCount == 1 {
            imageAndTitleStackView.alignment = .center
        } else {
            imageAndTitleStackView.alignment = .top
        }
    }
}

//MARK: - UI
extension FeedTableViewCell {
    
    func setupUI() {
        
        contentView.backgroundColor = AppColors.feedTableViewBackground
        
        containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.borderColor = AppColors.feedTableViewCellBorderColor?.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.masksToBounds = false
        containerView.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
        containerView.layer.shadowColor = AppColors.feedTableViewCellShadowColor?.cgColor
        containerView.layer.shadowOpacity = 0.2
        
        contentView.addSubview(containerView)
        containerView.apply {
            $0.leadingConstraint(constant: 15)
            $0.trailingConstaint(constant: -15)
            $0.topConstraint(constant: 15)
            $0.bottomConstraint(constant: 0)
        }
        
        rootStackView = UIStackView()
        rootStackView.distribution = .fill
        rootStackView.axis = .vertical
        
        containerView.addSubview(rootStackView)
        rootStackView.apply {
            $0.topConstraint(constant: 20)
            $0.trailingConstaint(constant: -20)
            $0.bottomConstraint(constant: -10)
            $0.leadingConstraint(constant: 20)
        }
        
        setImageAndTitleStackView()
        setNameDateAndTagsStackView()
        setBottomView()
    }
    
    private func setImageAndTitleStackView() {
        
        imageAndTitleStackView = UIStackView()
        imageAndTitleStackView.axis = .horizontal
        imageAndTitleStackView.distribution = .fillProportionally
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
        
        nameAndDateLbl = UILabel()
        nameAndDateLbl.text = "Andrew Stetsenko ・ Apr 23"
        nameAndDateLbl.textColor = .gray
        nameAndDateLbl.textAlignment = .left
        nameAndDateLbl.font = UIFont.boldSystemFont(ofSize: 13)
        
        nameAndDateContainer.addSubview(nameAndDateLbl)
        nameAndDateLbl.apply {
            $0.topConstraint(constant: 10)
            $0.bottomConstraint(constant: 0)
            $0.leadingConstraint(constant: 40 + 10)
        }
        
        timeAgoLbl = UILabel()
        timeAgoLbl.text = "(9 mins ago)"
        timeAgoLbl.textColor = .lightGray
        timeAgoLbl.textAlignment = .left
        timeAgoLbl.font = nameAndDateLbl.font.withSize(11)
        nameAndDateContainer.addSubview(timeAgoLbl)
        timeAgoLbl.apply {
            $0.topConstraint(constant: 10)
            $0.trailingConstaint(constant: -15)
            $0.bottomConstraint(constant: 0)
            $0.leadingConstraint(onTrailingOf: nameAndDateLbl, constant: 5)
        }
        
        let tagListContainer = UIView()
        nameDateTagsStackView.addArrangedSubview(tagListContainer)

        tagListContainer.apply {
            $0.heightConstraint(constant: 28)
        }
        
        tagListLbl = UILabel()
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
    
    private func setBottomView() {
        
        let bottomViewContainer = UIView()
        
        let reactionsAndCommentsView = getReactionsAndCommentsView()
        bottomViewContainer.addSubview(reactionsAndCommentsView)
        reactionsAndCommentsView.apply {
            $0.leadingConstraint(constant: 0)
            $0.centerToParentVertical()
        }
        
        let timeToReadAndSaveView = getTimeToReadAndSaveView()
        bottomViewContainer.addSubview(timeToReadAndSaveView)
        timeToReadAndSaveView.apply {
            $0.trailingConstaint(constant: 0)
            $0.centerToParentVertical()
        }
        rootStackView.addArrangedSubview(bottomViewContainer)
        bottomViewContainer.apply {
            $0.heightConstraint(constant: 40)
        }
    }
    
    private func getReactionsAndCommentsView() -> UIView {
        
        let reactionsAndCommentsContainer = UIView()
        
        reactionsStackView = getIconAndTextStackView(icon: #imageLiteral(resourceName: "likes"), text: "43")
        reactionsAndCommentsContainer.addSubview(reactionsStackView)
        reactionsStackView.apply {
            $0.leadingConstraint(constant: 5)
            $0.centerToParentVertical()
        }
        
        commentsStackView = getIconAndTextStackView(icon: #imageLiteral(resourceName: "comment"), text: "59")
        reactionsAndCommentsContainer.addSubview(commentsStackView)
        commentsStackView.apply {
            $0.centerToParentVertical()
            $0.leadingConstraint(onTrailingOf: reactionsStackView, constant: 5)
        }
        
        return reactionsAndCommentsContainer
    }
    
    private func getIconAndTextStackView(icon: UIImage, text: String) -> UIStackView {
        
        let iconAndTextStackView = UIStackView()
        iconAndTextStackView.axis = .horizontal
        iconAndTextStackView.distribution = .fillProportionally
        iconAndTextStackView.spacing = 10
        
        let iconImageView = UIImageView()
        iconImageView.image = icon
        iconImageView.contentMode = .scaleAspectFit
        
        iconAndTextStackView.addArrangedSubview(iconImageView)
        iconImageView.apply {
            $0.widthConstraint(constant: 30)
            $0.heightConstraint(constant: 30)
        }
        
        let textLbl = UILabel()
        textLbl.text = text
        textLbl.font = UIFont.boldSystemFont(ofSize: 13)
        textLbl.textColor = .gray
        
        iconAndTextStackView.addArrangedSubview(textLbl)
        
        return iconAndTextStackView
    }
    
    private func getTimeToReadAndSaveView() -> UIView {
        
        let timeToReadAndSaveContainer = UIView()
        
        let saveImageView = UIImageView()
        saveImageView.image = #imageLiteral(resourceName: "save")
        saveImageView.contentMode = .scaleAspectFit
        
        timeToReadAndSaveContainer.addSubview(saveImageView)
        saveImageView.apply {
            $0.widthConstraint(constant: 50)
            $0.heightConstraint(constant: 50)
            $0.trailingConstaint(constant: 0)
            $0.centerToParentVertical()
        }
        
        let timeToReadLbl = UILabel()
        timeToReadLbl.text = "8 min read"
        timeToReadLbl.font = UIFont.boldSystemFont(ofSize: 13)
        timeToReadLbl.textColor = .gray
        
        timeToReadAndSaveContainer.addSubview(timeToReadLbl)
        timeToReadLbl.apply {
            $0.trailingConstaint(onLeadingOf: saveImageView, constant: -20)
            $0.centerToParentVertical()
        }
        
        return timeToReadAndSaveContainer
    }
}
