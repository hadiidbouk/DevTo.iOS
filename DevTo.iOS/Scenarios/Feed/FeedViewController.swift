//
//  FeedViewController.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FeedViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var viewModel: FeedViewModel!
    
    var currentFeedType: String = ""
    
    //UI
    var navigationBarView: NavigationBarView!
    var feedTableView: UITableView!
    var feedTableViewHeader: FeedTableViewHeader!
    var feedTypesAlertController: UIAlertController!
    var feedTypeDoneBtn: UIButton!
    var feedTypesPickerView: UIPickerView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        viewModel = FeedViewModel()
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
        setupFeedFilterPickerAlert()
        setupViewActions()
    }
    
    private func setupNavigationBarView() {
        navigationBarView = NavigationBarView()
        navigationBarView.setToTop(view: view)
    }
    
    private func setupFeedTableView() {
        feedTableView = UITableView()
        feedTableView.separatorStyle = .none
        feedTableView.tableFooterView = UIView()
        feedTableView.backgroundColor = AppColors.feedTableViewBackground
        feedTableView.showsVerticalScrollIndicator = false
        
        feedTableView.rowHeight = UITableView.automaticDimension
        feedTableView.estimatedRowHeight = 100
        
        feedTableViewHeader = FeedTableViewHeader()
        feedTableView.tableHeaderView = feedTableViewHeader
        
        view.addSubview(feedTableView)
        feedTableView.apply {
            $0.topConstraint(onBottomOf: navigationBarView, constant: 1)
            $0.leadingConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
            $0.bottomConstraint(constant: 0)
        }
        
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.className)
        
        feedTableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)

        viewModel.articles
            .bind(to: feedTableView.rx.items(cellIdentifier: FeedTableViewCell.className, cellType: FeedTableViewCell.self)) { [weak self] (row, element, cell) in
                guard let strongSelf = self else { return }
                let dto = strongSelf.viewModel.transform(article: element)
                cell.bindViews(dto: dto)
            }
            .disposed(by: disposeBag)
    }
    
    private func setupFeedFilterPickerAlert() {
        
        feedTypesAlertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        
        feedTypesPickerView = UIPickerView()

        var feedTypes = [String]()
        FeedType.allCases.forEach {
            feedTypes.append($0.rawValue)
        }
        
        Observable.of(feedTypes)
            .bind(to: feedTypesPickerView.rx.itemTitles) { _, item in
                return "\(item)"
            }
            .disposed(by: disposeBag)
        
        feedTypesAlertController.view.addSubview(feedTypesPickerView)
        feedTypesPickerView.apply {
            $0.topConstraint(constant: 0)
            $0.heightConstraint(constant: 150)
            $0.widthConstraint(constant: 200)
            $0.centerToParentHorizontal()
        }

        feedTypeDoneBtn = UIButton(type: .system)
        feedTypeDoneBtn.setTitle("Done", for: .normal)
        feedTypeDoneBtn.setTitleColor(.black, for: .normal)
        
        feedTypesAlertController.view.addSubview(feedTypeDoneBtn)
        feedTypeDoneBtn.apply {
            $0.topConstraint(onBottomOf: feedTypesPickerView, constant: 10)
            $0.leadingConstraint(constant: 0)
            $0.trailingConstaint(constant: 0)
            $0.bottomConstraint(constant: -10)
        }
    }
}

//MARK: - Tap Gestures
extension FeedViewController {
    
    private func setupViewActions() {
        
        setupFeedTypeTapGestures()
        setupPickerViewItemChange()
    }
    
    private func setupFeedTypeTapGestures() {
        
        feedTableViewHeader.feedTypeButton.rx.tap.bind(onNext: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.present(strongSelf.feedTypesAlertController, animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        feedTypeDoneBtn.rx.tap.bind(onNext: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.feedTypesAlertController.dismiss(animated: true, completion: nil)
            strongSelf.feedTableViewHeader.feedTypeButton.setTitle(strongSelf.currentFeedType, for: .normal)
        }).disposed(by: disposeBag)
    }
    
    private func setupPickerViewItemChange() {
        feedTypesPickerView.rx.itemSelected.subscribe({ [weak self] (value) in
            guard let rowIndex = value.element?.row else { return }
            self?.currentFeedType = FeedType.allCases[rowIndex].rawValue
        }).disposed(by: disposeBag)
    }
}

//MARK: - UITableViewDelegate
extension FeedViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.animate()
    }
}
