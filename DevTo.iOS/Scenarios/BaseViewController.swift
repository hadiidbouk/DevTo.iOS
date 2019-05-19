//
//  ViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    
    var navigationBarView: NavigationBarView!

    func setupNavigationBarView() {
        navigationBarView = NavigationBarView()
        navigationBarView.setToTop(view: view)
    }
}
