//
//  PostCell.swift
//  ForumThreads
//
//  Created by aSqar on 10.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class PostCell: BaseTableViewCell<PostViewModel> {
    
    @IBOutlet fileprivate weak var txtTitle: UILabel?
    @IBOutlet fileprivate weak var txtBody: UILabel?
    
    override func setViewModel(viewModel: PostViewModel!) {
        self.viewModel = viewModel
     
        self.txtTitle?.text = viewModel.post.title
        self.txtBody?.text = viewModel.post.body
    }
}
