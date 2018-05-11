//
//  UserViewController.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit
import KVNProgress

class UserViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var viewModel : UserViewModel!
    
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblEmail: UILabel?
    @IBOutlet weak var lblUsername: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.refresh()
        })
    }
    
    func refresh() {
        self.lblName?.text = self.viewModel.user.name
        self.lblEmail?.text = self.viewModel.user.email
        self.lblUsername?.text = self.viewModel.user.username
    }
    
}
