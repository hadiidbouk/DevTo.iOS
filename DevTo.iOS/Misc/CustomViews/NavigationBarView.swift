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
    
    init() {
        super.init(frame: .zero)
        

        backgroundColor = AppColors.navigationBarBackground
        
        devImageView = UIImageView()
        devImageView.contentMode = .scaleAspectFit
        devImageView.image = #imageLiteral(resourceName: "dev_icon")
        
        addSubview(devImageView)
        devImageView.apply {
            $0.leadingConstraint(constant: 10)
            $0.centerToParentVertical()
            $0.heightConstraint(constant: 30)
            $0.widthConstraint(constant: 40)
        }
        
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            
            textfield.backgroundColor = AppColors.searchBarBackground
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            textfield.placeholder = "search"
            textfield.roundedCorners(radius: 10)
            textfield.font = textfield.font?.withSize(13)
        }
        
        addSubview(searchBar)
        searchBar.apply {
            $0.leadingConstraint(onTrailingOf: devImageView, constant: 10)
            $0.centerToParentVertical()
            $0.heightConstraint(constant: 30)
            $0.widthConstraint(constant: 240)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setToTop(view: UIView) {
        
        view.addSubview(self)
        self.apply {
            $0.topConstraint(constant: UIScreen.topSafeArea)
            $0.leadingConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
            $0.heightConstraint(constant: 44)
        }
    }
}
