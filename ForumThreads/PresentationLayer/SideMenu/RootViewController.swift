//
//  RootViewController.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import RESideMenu

class RootViewController : RESideMenu
{
    override func awakeFromNib() {
        self.leftMenuViewController = UIStoryboard(name: "Menu", bundle: nil).instantiateInitialViewController()
        self.contentViewController = UIStoryboard(name: "Posts", bundle: nil).instantiateInitialViewController()
        
        self.delegate = self.leftMenuViewController as! RESideMenuDelegate?;
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        let offset = CGFloat(83.0)
        self.contentViewInLandscapeOffsetCenterX = UIScreen.main.bounds.size.width - offset
        self.contentViewInPortraitOffsetCenterX = UIScreen.main.bounds.size.width / 2.0 - offset

        super.awakeFromNib()
    }
}
