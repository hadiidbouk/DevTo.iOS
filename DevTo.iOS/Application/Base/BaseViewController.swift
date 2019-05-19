//
//  ViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/19/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController : UIViewController {
    
    private let disposeBag = DisposeBag()
    
    var navigationBarView: NavigationBarView!

    func setupNavigationBarView() {
        navigationBarView = NavigationBarView()
        navigationBarView.setToTop(view: view)
        
        navigationBarView.devTapGesture.rx.event.bind(onNext: { [weak self] recognizer in
            if let viewControllers = self?.navigationController?.viewControllers {
                self?.navigationController?.popToViewController(viewController: viewControllers[0])
            }
        }).disposed(by: disposeBag)
    }
}
