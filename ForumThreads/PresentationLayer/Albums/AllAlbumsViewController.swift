//
//  AllAlbumsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation

class AllAlbumsViewController: AlbumListViewController<AlbumListViewModel> {
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
