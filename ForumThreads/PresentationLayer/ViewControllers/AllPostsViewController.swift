//
//  PopularFeedsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 24.11.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class AllPostsViewController : BaseTableViewController<RlmPost, AllPostsViewModel> {

    override func viewDidLoad() {
        self.viewModel = AllPostsViewModel()
        super.viewDidLoad()
        setupSideMenu()
    }
    
    override var cellIdentifier : String {
        return "PostCell"
    }

    override func showSpinner() {
        self.showLoadingView(msg: "Loading posts...".localized)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is SearchViewController) {
            let searchViewModel:SearchViewModel! = SearchViewModel()
            let vc:SearchViewController! = segue.destination as! SearchViewController
            vc.viewModel = searchViewModel
        }
    }
}
