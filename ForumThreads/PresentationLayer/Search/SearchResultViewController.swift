//
//  SearchResultViewController.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class SearchResultViewController : BaseCollectionViewController<RlmPost, SearchResultViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func showSpinner() {
        self.showLoadingView(msg: "Loading search results...".localized)
    }
}
