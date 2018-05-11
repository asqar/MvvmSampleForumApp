//
//  CommentCell.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class CommentCell: BaseTableViewCell<CommentViewModel> {
    
    @IBOutlet fileprivate weak var txtEmail: UILabel?
    @IBOutlet fileprivate weak var txtBody: UILabel?
    @IBOutlet fileprivate weak var txtName: UILabel?
    
    override func setViewModel(viewModel: CommentViewModel!) {
        super.setViewModel(viewModel: viewModel)
    }
    
    override func refresh(){
        self.txtEmail?.text = viewModel.comment.email
        self.txtBody?.text = viewModel.comment.body
        self.txtName?.text = viewModel.comment.name
    }
}

