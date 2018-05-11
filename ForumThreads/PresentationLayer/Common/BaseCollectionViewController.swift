//
//  BaseListViewController.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit
import KVNProgress
import SVPullToRefresh
import ReactiveCocoa
import RealmSwift

class BaseCollectionViewController<RealmType : Object, VM: FetchedResultsViewModelProtocol> : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var pullToRefreshView: SVPullToRefreshView?
    
    var viewModel:VM = FetchedResultsViewModel<RealmType>() as! VM
    
    deinit {
        self.collectionView?.delegate = nil;
        self.collectionView?.dataSource = nil;
    }
    
    var cellIdentifier : String {
        return "BaseCell"
    }
    
    var useInfiniteScrollingView : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.title = self.viewModel.title
        
        self.collectionView?.addPullToRefresh(actionHandler: {
            self.viewModel.fetchData(updating: true)
        })
        if useInfiniteScrollingView {
            self.collectionView?.addInfiniteScrolling(actionHandler: {
                self.viewModel.fetchData(updating: false)
            })
        }
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.collectionView?.reloadData()
            self.collectionView?.pullToRefreshView.stopAnimating()
            if self.useInfiniteScrollingView {
                self.collectionView?.infiniteScrollingView.stopAnimating()
            }
            })
        self.viewModel.dismissLoadingSignal.subscribeNext({ (x) in
            self.hideLoadingView()
            })
        self.viewModel.startLoadingSignal.subscribeNext({ (x) in

            })
        self.viewModel.errorMessageSignal.subscribeNext({ (x) in
            KVNProgress.showError(withStatus: "Technical error. Try again later".localized)
            })

        self.showSpinner()
        self.viewModel.fetchData(updating: true)
    }

    func showSpinner() {
        self.showLoadingView(msg: "Loading results...".localized)
    }

    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.viewModel.isActive = true
    }

    override func viewDidDisappear(_ animated:Bool) {
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UICollectionView data source

    func numberOfSectionsInCollectionView(collectionView:UICollectionView!) -> Int {
        return self.viewModel.numberOfSections()
    }

    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return self.viewModel.numberOfItemsInSection(section: section)
    }

    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! BaseCollectionViewCell
        cell.setViewModel(viewModel: self.viewModel.objectAtIndexPath(indexPath: indexPath) as BaseViewModel?)
        return cell
    }

    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath) {

        self.collectionView?.deselectItem(at: indexPath, animated:true)
    }

}