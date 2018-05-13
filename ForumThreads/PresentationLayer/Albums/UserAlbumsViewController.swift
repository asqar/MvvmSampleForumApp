//
//  UserAlbumsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class UserAlbumsViewController: AlbumListViewController<UserAlbumsViewModel> {
    
    @IBOutlet weak var mySearchBar: UISearchBar?
    
    override var searchBar: UISearchBar?
    {
        return mySearchBar
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is NewAlbumViewController) {
            let vm = self.viewModel.createNewAlbum()
            let vc = segue.destination as! NewAlbumViewController
            vc.viewModel = vm
        }
    }
}
