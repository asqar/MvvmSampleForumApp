//
//  AlbumCell.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class AlbumCell: BaseTableViewCell<AlbumViewModel> {
    
    @IBOutlet fileprivate weak var txtTitle: UILabel?
    
    override func setViewModel(viewModel: AlbumViewModel!) {
        super.setViewModel(viewModel: viewModel)
    }
    
    override func refresh(){
        self.txtTitle?.text = viewModel.album.title
    }
}


