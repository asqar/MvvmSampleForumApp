//
//  PopularFeedsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 24.11.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class AllPostsViewController : PostListViewController<PostListViewModel> {
    
    @IBOutlet weak var mySearchBar: UISearchBar?
    
    override var searchBar: UISearchBar?
    {
        return mySearchBar
    }
    
    override func viewDidLoad() {
        self.viewModel = PostListViewModel()
        setupSideMenu()
    }
    
    @IBAction func showMenu()
    {
        self.openSideMenu()
    }
}
