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
        super.setViewModel(viewModel: viewModel)
    }
    
    override func refresh(){
        self.txtTitle?.text = viewModel.post.title
        self.txtBody?.text = viewModel.post.body
        
        if viewModel.user.id == 0 {
            self.txtUserName?.text = "loading...".localized
        } else {
            let userName = String(format: "%@ %@, %@ %@", "by".localized, viewModel.user.name, "from".localized, viewModel.user.address?.city ?? "unknown place".localized)
            self.txtUserName?.text = userName
        }
    }
}
