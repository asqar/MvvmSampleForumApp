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
    @IBOutlet fileprivate weak var txtUserName: UILabel?
    
    override func setViewModel(viewModel: PostViewModel!) {
        self.viewModel = viewModel
     
        self.txtTitle?.text = viewModel.post.title
        self.txtBody?.text = viewModel.post.body
        self.txtUserName?.text = viewModel.post.user?.name
    }
}
