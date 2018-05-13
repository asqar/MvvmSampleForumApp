//
//  AllAlbumsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class AllAlbumsViewController: AlbumListViewController<AlbumListViewModel> {
    
    @IBOutlet weak var mySearchBar: UISearchBar?
    
    override var searchBar: UISearchBar?
    {
        return mySearchBar
    }
    
    override func viewDidLoad() {
        self.viewModel = AlbumListViewModel()
        super.viewDidLoad()
        setupSideMenu()
    }
    
    @IBAction func showMenu()
    {
        self.openSideMenu()
    }
}
