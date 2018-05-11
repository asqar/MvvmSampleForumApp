//
//  UserCell.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class UserCell: BaseTableViewCell<UserViewModel> {
    
    @IBOutlet fileprivate weak var lblName: UILabel?
    
    override func setViewModel(viewModel: UserViewModel!) {
        super.setViewModel(viewModel: viewModel)
    }
    
    override func refresh(){
        self.lblName?.text = viewModel.user.name        
    }
}
