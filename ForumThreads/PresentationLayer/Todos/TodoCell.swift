//
//  TodoCell.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class TodoCell: BaseTableViewCell<TodoViewModel> {
    
    @IBOutlet fileprivate weak var txtTitle: UILabel?
    
    override func setViewModel(viewModel: TodoViewModel!) {
        super.setViewModel(viewModel: viewModel)
    }
    
    override func refresh(){
        self.txtTitle?.text = viewModel.todo.title
        self.accessoryType = viewModel.todo.completed ? .checkmark : .none
    }
}


