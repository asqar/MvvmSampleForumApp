//
//  UserPhotosViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class AlbumPhotosViewController: PhotoListViewController<AlbumPhotosViewModel> {
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is NewPhotoViewController) {
            let vm = self.viewModel.createNewPhoto()
            let vc = segue.destination as! NewPhotoViewController
            vc.viewModel = vm
        }
    }
}
