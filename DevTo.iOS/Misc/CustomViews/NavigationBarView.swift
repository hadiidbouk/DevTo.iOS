//
//  NavigationBarView.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class NavigationBarView : UIView {
    
    var devImageView: UIImageView!
    var searchBar: UISearchBar!
    var searchBarTextField: UITextField!
    var connectImageView: UIImageView!
    var notificationImageView: UIImageView!
    var navigationImageView: UIImageView!
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setToTop(view: UIView) {
        
        view.addSubview(self)
        self.apply {
            $0.topConstraint(constant: 0)
            $0.leadingConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
            $0.heightConstraint(constant: 44 + UIScreen.topSafeArea)
        }
    }
}

extension NavigationBarView {
    
    private func setupUI() {
        
        backgroundColor = AppColors.navigationBarBackground

        setupDevImageView()
        setupSearchBar()
        setupNavigationImageView()
        setupConnectAndNotificationStackView()
    }
    
    private func setupDevImageView() {
        devImageView = UIImageView()
        devImageView.contentMode = .scaleAspectFit
        devImageView.image = #imageLiteral(resourceName: "dev_icon")
        
        addSubview(devImageView)
        devImageView.apply {
            $0.leadingConstraint(constant: 10)
            $0.topConstraint(constant: UIScreen.topSafeArea + 4)
            $0.heightConstraint(constant: 40)
            $0.widthConstraint(constant: 50)
        }
    }
    
    private func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            
            searchBarTextField = textfield
            
            textfield.backgroundColor = AppColors.searchBarBackground
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            textfield.placeholder = "search"
            textfield.roundedCorners(radius: 10)
            textfield.font = textfield.font?.withSize(13)
            textfield.leftView = nil
        }
        
        addSubview(searchBar)
        searchBar.apply {
            $0.leadingConstraint(onTrailingOf: devImageView, constant: 5)
            $0.topConstraint(constant: UIScreen.topSafeArea + 8)
            $0.heightConstraint(constant: 30)
            $0.widthConstraint(constant: UIScreen.main.bounds.width / 2)
        }
    }
    
    private func setupNavigationImageView() {
        navigationImageView = UIImageView()
        navigationImageView.contentMode = .scaleAspectFit
        navigationImageView.image = #imageLiteral(resourceName: "menu")
        
        addSubview(navigationImageView)
        navigationImageView.apply {
            $0.trailingConstaint(constant: -10)
            $0.heightConstraint(constant: 25)
            $0.widthConstraint(constant: 25)
            $0.centerVertical(dependingOn: searchBar)
        }
    }
    
    private func setupConnectAndNotificationStackView() {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        //Connect Image
        let connectImageViewContainer = UIView()
        connectImageView = UIImageView()
        connectImageView.contentMode = .scaleAspectFit
        connectImageView.image = #imageLiteral(resourceName: "connect")
        
        connectImageViewContainer.addSubview(connectImageView)
        connectImageView.apply {
            $0.heightConstraint(constant: 30)
            $0.widthConstraint(constant: 30)
            $0.centerToParentVertical()
            $0.centerToParentHorizontal()
        }
        
        stackView.addArrangedSubview(connectImageViewContainer)

        //notification Image
        let notificationImageViewContainer = UIView()
        notificationImageView = UIImageView()
        notificationImageView.contentMode = .scaleAspectFit
        notificationImageView.image = #imageLiteral(resourceName: "notification")
        
        notificationImageViewContainer.addSubview(notificationImageView)
        notificationImageView.apply {
            $0.heightConstraint(constant: 25)
            $0.widthConstraint(constant: 25)
            $0.centerToParentVertical()
            $0.centerToParentHorizontal()
        }
        
        stackView.addArrangedSubview(notificationImageViewContainer)
        
        //stack view constraints
        addSubview(stackView)
        stackView.apply {
            $0.leadingConstraint(onTrailingOf: searchBarTextField, constant: 5)
            $0.trailingConstaint(onLeadingOf: navigationImageView, constant: -10)
            $0.centerVertical(dependingOn: searchBar)
        }
    }
    
    private func setupNotificationImageView() {
        
    }
}
