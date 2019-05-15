//
//  FeedViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    //UI
    var navigationBarView: NavigationBarView!
    var feedTableView: UITableView!
    var feedTableViewHeader: FeedTableViewHeader!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

//MARK: - UI
extension FeedViewController {
    
    private func setupUI() {
        
        setupNavigationBarView()
        setupFeedTableView()
    }
    
    private func setupNavigationBarView() {
        navigationBarView = NavigationBarView()
        navigationBarView.setToTop(view: view)
    }
    
    private func setupFeedTableView() {
        feedTableView = UITableView()
        feedTableView.separatorStyle = .none
        feedTableView.tableFooterView = UIView()
        
        let feedTableViewHeader = FeedTableViewHeader()
        feedTableView.tableHeaderView = feedTableViewHeader
        
        view.addSubview(feedTableView)
        feedTableView.apply {
            $0.topConstraint(onBottomOf: navigationBarView, constant: 1)
            $0.leadingConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
            $0.bottomConstraint(constant: 0)
        }
    }
}
