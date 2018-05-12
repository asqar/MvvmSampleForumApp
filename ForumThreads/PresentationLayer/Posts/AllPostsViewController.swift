//
//  PopularFeedsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 24.11.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class AllPostsViewController : PostListViewController<PostListViewModel> {
    
    override func viewDidLoad() {
        self.viewModel = PostListViewModel()
        super.viewDidLoad()
        setupSideMenu()
    }
    
    @IBAction func showMenu()
    {
        self.openSideMenu()
    }
}
