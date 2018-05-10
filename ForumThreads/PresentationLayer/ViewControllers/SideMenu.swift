//
//  RootViewController.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import SideMenu

extension AllPostsViewController {
    
    func setupSideMenu() {
        if SideMenuManager.default.menuLeftNavigationController != nil {
            return
        }
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "MenuNavigationController") as? UISideMenuNavigationController
        SideMenuManager.default.menuRightNavigationController = nil
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
//        SideMenuManager.default.menuAnimationBackgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        SideMenuManager.default.menuPresentMode = .viewSlideOut
    }
    
    
}

extension AllPostsViewController: UISideMenuNavigationControllerDelegate {
    
    @nonobjc func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
        
    }
    
    @nonobjc func sideMenuDidAppear(menu: UISideMenuNavigationController, animated: Bool) {
        
    }
    
    @nonobjc func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        
    }
    
    @nonobjc func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        
    }
    
}
