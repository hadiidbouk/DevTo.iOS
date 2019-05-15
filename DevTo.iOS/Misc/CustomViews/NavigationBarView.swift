//
//  NavigationBarView.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NavigationBarView : UIView {
    
    //UI
    private var devImageView: UIImageView!
    private var searchBar: UISearchBar!
    private var searchBarTextField: UITextField!
    private var connectImageView: UIImageView!
    private var notificationImageView: UIImageView!
    private var navigationImageView: UIImageView!
    
    private let disposeBag = DisposeBag()
    
    var navigationTapGesture: UITapGestureRecognizer!
    var notificationTapGesture: UITapGestureRecognizer!
    var connectTapGesture: UITapGestureRecognizer!
    var devTapGesture: UITapGestureRecognizer!
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
        setupTapGestures()
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

//MARK: - UI
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
        stackView.isUserInteractionEnabled = true
        
        //Connect Image
        connectImageView = UIImageView()
        connectImageView.contentMode = .scaleAspectFit
        connectImageView.image = #imageLiteral(resourceName: "connect")
        
        stackView.addArrangedSubview(connectImageView)

        //notification Image
        notificationImageView = UIImageView()
        notificationImageView.contentMode = .scaleAspectFit
        notificationImageView.image = #imageLiteral(resourceName: "notification")
        
        stackView.addArrangedSubview(notificationImageView)
        
        //stack view constraints
        addSubview(stackView)
        stackView.apply {
            $0.leadingConstraint(onTrailingOf: searchBarTextField, constant: 5)
            $0.trailingConstaint(onLeadingOf: navigationImageView, constant: -10)
            $0.centerVertical(dependingOn: searchBar)
        }
    }
}

//MARK: - Tap Gestures
extension NavigationBarView {
    
    private func setupTapGestures() {
        setNavigationTapGesture()
        setNotificationTapGesture()
        setConnectTapGesture()
        setDevTapGesture()
    }
    
    private func setNavigationTapGesture() {
        navigationTapGesture = UITapGestureRecognizer()
        navigationImageView.addGestureRecognizer(navigationTapGesture)
        navigationImageView.isUserInteractionEnabled = true
        
        navigationTapGesture.rx.event.bind(onNext: { [weak self] recognizer in
            self?.navigationImageView.alpha = 0.75
            UIView.animate(withDuration: 0.5) {
                self?.navigationImageView.alpha = 1.0
            }
        }).disposed(by: disposeBag)
    }
    
    private func setNotificationTapGesture() {
        notificationTapGesture = UITapGestureRecognizer()
        notificationImageView.addGestureRecognizer(notificationTapGesture)
        notificationImageView.isUserInteractionEnabled = true
        
        notificationTapGesture.rx.event.bind(onNext: { [weak self] recognizer in
            self?.notificationImageView.alpha = 0.75
            UIView.animate(withDuration: 0.5) {
                self?.notificationImageView.alpha = 1.0
            }
        }).disposed(by: disposeBag)
    }
    
    private func setConnectTapGesture() {
        connectTapGesture = UITapGestureRecognizer()
        connectImageView.addGestureRecognizer(connectTapGesture)
        connectImageView.isUserInteractionEnabled = true
        
        connectTapGesture.rx.event.bind(onNext: { [weak self] recognizer in
            self?.connectImageView.alpha = 0.75
            UIView.animate(withDuration: 0.5) {
                self?.connectImageView.alpha = 1.0
            }
        }).disposed(by: disposeBag)
    }
    
    private func setDevTapGesture() {
        devTapGesture = UITapGestureRecognizer()
        devImageView.addGestureRecognizer(devTapGesture)
        devImageView.isUserInteractionEnabled = true
        
        devTapGesture.rx.event.bind(onNext: { [weak self] recognizer in
            self?.devImageView.alpha = 0.75
            UIView.animate(withDuration: 0.5) {
                self?.devImageView.alpha = 1.0
            }
        }).disposed(by: disposeBag)
    }
}
