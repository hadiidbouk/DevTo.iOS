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
    var titleLbl: UILabel!
    var userImageView: UIImageView!
    var userDisplayNameLbl: UILabel!
    var dateAndReadingTimeLbl: UILabel!
    
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
        setupCoverImageView()
        setupTitleLbl()
        setupInfoView()
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
        rootStackView.spacing = 10
        
        scrollView.addSubview(rootStackView)
        rootStackView.apply {
            $0.stickToParentEdges()
            $0.widthConstraint(sameAs: scrollView)
        }
    }
    
    private func setupCoverImageView() {
        
        let coverImageViewContainer = UIView()
        coverImageView = UIImageView()
        coverImageView.contentMode = .scaleToFill
        coverImageView.kf.setImage(with: URL(string: "https://res.cloudinary.com/practicaldev/image/fetch/s--AUUgycTq--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://nickjanetakis.com/assets/blog/cards/live-demo-of-planning-a-real-world-web-application-from-scratch-30ca0565b15268fe02dbe1aee1b9f94ce34fb8e263413d68628a7984465aaeae.jpg")!)
        
        coverImageViewContainer.addSubview(coverImageView)
        coverImageView.apply {
            $0.stickToParentEdges()
        }
        
        rootStackView.addArrangedSubview(coverImageViewContainer)
        
        coverImageViewContainer.apply {
            $0.aspectRatioConstraint(multiplier: 9/21)
        }
    }
    
    private func setupTitleLbl() {
        
        let titleLblContainer = UIView()
        rootStackView.addArrangedSubview(titleLblContainer)

        titleLbl = UILabel()
        titleLbl.text = "Live Demo of Planning a Real World Web Application from Scratch"
        titleLbl.textColor = .black
        titleLbl.font = UIFont.boldSystemFont(ofSize: 25)
        titleLbl.numberOfLines = 0
        
        titleLblContainer.addSubview(titleLbl)
        titleLbl.apply {
            $0.leadingConstraint(constant: 20)
            $0.topConstraint(constant: 0)
            $0.bottomConstraint(constant: 0)
            $0.trailingConstaint(constant: -10)
        }
        
        dateAndReadingTimeLbl = UILabel()
        dateAndReadingTimeLbl.textColor = AppColors.grayTextColor
        dateAndReadingTimeLbl.text = "May 20・3 min read"
        dateAndReadingTimeLbl.font = dateAndReadingTimeLbl.font.withSize(13)
        
        titleLblContainer.addSubview(dateAndReadingTimeLbl)
        dateAndReadingTimeLbl.apply {
            $0.leadingConstraint(view: titleLbl, constant: 0)
            $0.topConstraint(onBottomOf: titleLbl, constant: 10)
            $0.trailingConstaint(constant: -10)
        }
    }
    
    private func setupInfoView() {
        
        let infoView = UIView()
        rootStackView.addArrangedSubview(infoView)
        
        userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFit
        userImageView.roundedCorners(radius: 20)
        userImageView.kf.setImage(with: URL(string: "https://res.cloudinary.com/practicaldev/image/fetch/s--YUR-hRL9--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://thepracticaldev.s3.amazonaws.com/uploads/user/profile_image/68035/985891c3-d691-4fc3-8b42-0a1de8a82f8b.jpeg")!)
        
        infoView.addSubview(userImageView)
        userImageView.apply {
            $0.topConstraint(constant: 30)
            $0.leadingConstraint(constant: 20)
            $0.widthConstraint(constant: 40)
            $0.heightConstraint(constant: 40)
        }
        
        let infoStackView = UIStackView()
        infoStackView.axis = .vertical
        infoStackView.distribution = .fill
        infoStackView.spacing = 15
        
        infoView.addSubview(infoStackView)
        infoStackView.apply {
            $0.leadingConstraint(onTrailingOf: userImageView, constant: 10)
            $0.topConstaint(view: userImageView, constant: 0)
        }
        
        //Name
        userDisplayNameLbl = UILabel()
        userDisplayNameLbl.textColor = AppColors.grayTextColor
        userDisplayNameLbl.text = "Juan Manuel Ramallo"
        userDisplayNameLbl.font = UIFont.boldSystemFont(ofSize: 12)
        userDisplayNameLbl.adjustsFontSizeToFitWidth = true
        
        infoStackView.addArrangedSubview(userDisplayNameLbl)

        let socialView = getSocialView()
        infoStackView.addArrangedSubview(socialView)
    }
    
    private func getSocialView() -> UIView {
        
        let socialView = UIView()
        
        let twitterImageView = UIImageView()
        twitterImageView.image = #imageLiteral(resourceName: "twitter")
        twitterImageView.contentMode = .scaleAspectFit
        
        socialView.addSubview(twitterImageView)
        twitterImageView.apply {
            $0.leadingConstraint(constant: 0)
            $0.widthConstraint(constant: 18)
            $0.heightConstraint(constant: 18)
            $0.centerToParentVertical()
        }
        
        let gitHubImageView = UIImageView()
        gitHubImageView.image = #imageLiteral(resourceName: "github")
        gitHubImageView.contentMode = .scaleAspectFit
        
        socialView.addSubview(gitHubImageView)
        gitHubImageView.apply {
            $0.leadingConstraint(onTrailingOf: twitterImageView, constant: 10)
            $0.widthConstraint(constant: 18)
            $0.heightConstraint(constant: 18)
            $0.centerToParentVertical()
        }
        
        return socialView
    }
}
