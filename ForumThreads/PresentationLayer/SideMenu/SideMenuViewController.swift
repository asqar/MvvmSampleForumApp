//
//  SideMenuViewController.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RESideMenu

enum MenuItems : Int {
    case posts = 0
    case users
    case albums
    case photos
}

class SideMenuViewController: UITableViewController, RESideMenuDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // refresh cell blur effect in case it changed
        tableView.reloadData()
        
        // Set up a cool background image for demo purposes
        let imageView = UIImageView(image: UIImage(named: "saturn"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        tableView.backgroundView = imageView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menu = MenuItems(rawValue: indexPath.row)
        switch menu! {
        case .posts:
            self.sideMenuViewController.contentViewController = UIStoryboard(name: "Posts", bundle: nil).instantiateInitialViewController()
            break
        case .users:
            self.sideMenuViewController.contentViewController = UIStoryboard(name: "Users", bundle: nil).instantiateInitialViewController()
            break
        case .albums:
            self.sideMenuViewController.contentViewController = UIStoryboard(name: "Albums", bundle: nil).instantiateInitialViewController()
            break
        case .photos:
            self.sideMenuViewController.contentViewController = UIStoryboard(name: "Photos", bundle: nil).instantiateInitialViewController()
            break
        }
        self.sideMenuViewController.hideViewController()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
