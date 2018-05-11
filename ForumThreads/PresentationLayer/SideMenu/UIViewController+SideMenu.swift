//
//  RootViewController.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RESideMenu

extension UIViewController {
    
    func setupSideMenu() {
        
    }
    
    func openSideMenu() {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
    
    func closeSideMenu() {
        self.sideMenuViewController.hideViewController()
    }
}
