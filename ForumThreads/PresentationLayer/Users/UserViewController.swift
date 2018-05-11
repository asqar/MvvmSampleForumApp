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
    @IBOutlet weak var lblUsername: UILabel?
    @IBOutlet weak var lblPhone: UILabel?
    @IBOutlet weak var lblWebsite: UILabel?
    @IBOutlet weak var lblStreet: UILabel?
    @IBOutlet weak var lblCity: UILabel?
    @IBOutlet weak var lblGeo: UILabel?
    @IBOutlet weak var lblCompanyName: UILabel?
    @IBOutlet weak var lblCatchPhrase: UILabel?
    @IBOutlet weak var lblBs: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.refresh()
        })
        
        self.refresh()
    }
    
    func refresh() {
        self.lblName?.text = self.viewModel.user.name
        self.lblEmail?.text = self.viewModel.user.email
        self.lblUsername?.text = self.viewModel.user.username
        self.lblPhone?.text = self.viewModel.user.phone
        self.lblWebsite?.text = self.viewModel.user.website
        self.lblStreet?.text = String(format: "%@, %@",self.viewModel.user.address.street, self.viewModel.user.address.suite)
        self.lblCity?.text = String(format: "%@, %@",self.viewModel.user.address.zipcode, self.viewModel.user.address.city)
        self.lblGeo?.text = String(format: "%f,%f", self.viewModel.user.address.geo.lat, self.viewModel.user.address.geo.lng)
        self.lblCompanyName?.text = self.viewModel.user.company.name
        self.lblCatchPhrase?.text = self.viewModel.user.company.catchPhrase
        self.lblBs?.text = self.viewModel.user.company.bs
    }
    
}
