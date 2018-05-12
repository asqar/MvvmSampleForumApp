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
    
    // TODO: make proper UI
    
    @IBOutlet weak var cell1Name: UITableViewCell?
    @IBOutlet weak var cell2Email: UITableViewCell?
    @IBOutlet weak var cell3Username: UITableViewCell?
    @IBOutlet weak var cell4Phone: UITableViewCell?
    @IBOutlet weak var cell5Website: UITableViewCell?
    @IBOutlet weak var cell6Street: UITableViewCell?
    @IBOutlet weak var cell7City: UITableViewCell?
    @IBOutlet weak var cell8Geo: UITableViewCell?
    @IBOutlet weak var cell9CompanyName: UITableViewCell?
    @IBOutlet weak var cell10CatchPhrase: UITableViewCell?
    @IBOutlet weak var cell11Bs: UITableViewCell?
    
    @IBOutlet weak var cellTodos: UITableViewCell?
    @IBOutlet weak var cellAlbums: UITableViewCell?
    @IBOutlet weak var cellPosts: UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.refresh()
        })
        
        self.refresh()
    }
    
    func refresh() {
        self.title = self.viewModel.user.name
    
        self.cell1Name?.textLabel?.text = self.viewModel.user.name
        self.cell2Email?.textLabel?.text = "email: " + self.viewModel.user.email
        self.cell3Username?.textLabel?.text = "username: " + self.viewModel.user.username
        self.cell4Phone?.textLabel?.text = "phone: " + self.viewModel.user.phone
        self.cell5Website?.textLabel?.text = "website: " + self.viewModel.user.website
        self.cell6Street?.textLabel?.text = String(format: "%@, %@",self.viewModel.user.address.street, self.viewModel.user.address.suite)
        self.cell7City?.textLabel?.text = String(format: "%@, %@",self.viewModel.user.address.zipcode, self.viewModel.user.address.city)
        self.cell8Geo?.textLabel?.text = String(format: "%f,%f", self.viewModel.user.address.geo.lat, self.viewModel.user.address.geo.lng)
        self.cell9CompanyName?.textLabel?.text = "company: " + self.viewModel.user.company.name
        self.cell10CatchPhrase?.textLabel?.text = self.viewModel.user.company.catchPhrase
        self.cell11Bs?.textLabel?.text = self.viewModel.user.company.bs
        
        self.cell8Geo?.isHidden = self.viewModel.user.address.geo.lat == 0 || self.viewModel.user.address.geo.lng == 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is UserTodosViewController) {
            let vm = self.viewModel.openUserTodos()
            let vc = segue.destination as! UserTodosViewController
            vc.viewModel = vm!
        }
        if (segue.destination is UserAlbumsViewController) {
            let vm = self.viewModel.openUserAlbums()
            let vc = segue.destination as! UserAlbumsViewController
            vc.viewModel = vm!
        }
        if (segue.destination is UserPostsViewController) {
            let vm = self.viewModel.openUserPosts()
            let vc = segue.destination as! UserPostsViewController
            vc.viewModel = vm!
        }
    }
    
}
