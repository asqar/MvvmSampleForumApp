//
//  BaseTableViewController.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit
import KVNProgress
import SVPullToRefresh
import ReactiveCocoa
import RealmSwift
import FormToolbar

class BaseTableViewController<RealmType : Object, VM: FetchedResultsViewModelProtocol> : UITableViewController, ViewModelHelper, UISearchBarDelegate {
    
    var searchBar: UISearchBar? {
        return nil
    }
    
    typealias OwnerType = UITableViewCell
    typealias ViewModelType = BaseViewModel
    
    func setViewModelOwner(owner: UITableViewCell, viewModel: BaseViewModel!) {
        
    }
    
    @IBOutlet weak var pullToRefreshView: SVPullToRefreshView?
    
    var viewModel:VM
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = VM.init()
        super.init(coder: aDecoder)
    }
    
    deinit {
        self.tableView?.delegate = nil;
        self.tableView?.dataSource = nil;
    }
    
    var cellIdentifier : String {
        return "BaseCell"
    }
    
    var useInfiniteScrollingView : Bool = false
    
    var formToolbar: FormToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = self.viewModel.title
        
        let searchTextField = self.searchBar?.subviews.last?.subviews[1]
        if searchTextField is FormInput {
            self.formToolbar = FormToolbar(inputs: [searchTextField as! FormInput])
        }
        
        self.tableView?.addPullToRefresh(actionHandler: {
            self.viewModel.fetchData(updating: true)
        })
        if useInfiniteScrollingView {
            self.tableView?.addInfiniteScrolling(actionHandler: {
                self.viewModel.fetchData(updating: false)
            })
        }
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.tableView?.reloadData()
            self.tableView?.pullToRefreshView.stopAnimating()
            if self.useInfiniteScrollingView {
                self.tableView?.infiniteScrollingView.stopAnimating()
            }
        })
        self.viewModel.dismissLoadingSignal.subscribeNext({ (x) in
            self.hideLoadingView()
        })
        self.viewModel.startLoadingSignal.subscribeNext({ (x) in
            
        })
        self.viewModel.errorMessageSignal.subscribeError { (error:Error?) in
            switch(error!){
            case is NetworkError:
                KVNProgress.showError(withStatus: (error! as! NetworkError).message)
            default:
                KVNProgress.showError(withStatus: error?.localizedDescription)
            }
        }
        
        self.showSpinner()
    }
    
    func showSpinner() {
        self.showLoadingView(msg: "Loading results...".localized)
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.viewModel.isActive = true
        
        self.viewModel.fetchData(updating: true)
    }
    
    override func viewDidDisappear(_ animated:Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        self.setViewModelOwner(owner: cell, viewModel: self.viewModel.objectAtIndexPath(indexPath: indexPath) as BaseViewModel?)
        return cell
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView?.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK :- Search
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.searchTerm = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.count == 0
        {
            return
        }
        searchBar.endEditing(true)
        
        self.searchBar?.text = ""
    }
}

