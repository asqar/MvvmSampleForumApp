//
//  AllPhotosViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class AllPhotosViewController: PhotoListViewController<PhotoListViewModel> {
    
    @IBOutlet weak var myCollectionView: UICollectionView?
    @IBOutlet weak var mySearchBar: UISearchBar?
    
    override var searchBar: UISearchBar?
    {
        return mySearchBar
    }
    
    override var collectionView: UICollectionView?
    {
        return myCollectionView
    }
    
    override func viewDidLoad() {
        self.viewModel = PhotoListViewModel()
        super.viewDidLoad()
        setupSideMenu()
    }
    
    @IBAction func showMenu()
    {
        self.openSideMenu()
    }
}
