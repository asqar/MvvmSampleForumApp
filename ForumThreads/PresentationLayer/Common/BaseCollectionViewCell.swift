//
//  BaseCollectionViewCell.swift
//  ForumThreads
//
//  Created by aSqar on 09.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewCell<VM : BaseViewModel> : UICollectionViewCell {
    
    var viewModel:VM!
    
    func setViewModel(viewModel:VM!) {
        self.viewModel = viewModel
        
        self.refresh()
        
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.refresh()
        })
    }
    
    func refresh() { }
}
