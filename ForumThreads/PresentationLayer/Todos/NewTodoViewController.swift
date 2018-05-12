//
//  NewTodoViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit
import FormToolbar
import KVNProgress

class NewTodoViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var viewModel : NewTodoViewModel!
    
    @IBOutlet weak var textTitle: UITextView?
    
    var formToolbar: FormToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.formToolbar = FormToolbar(inputs: [ textTitle!])
        
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.refresh()
        })
    }
    
    func refresh() {
        if viewModel.isSaved
        {
            self.hideLoadingView()
            KVNProgress.showSuccess()
            self.navigationController?.popViewController(animated: true)
        } else {
            self.textTitle?.text = self.viewModel.todo.title
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.formToolbar?.update()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.formToolbar?.update()
    }
    
    @IBAction func pressSaveButton()
    {
        var todo = TodoDto()
        todo.title = textTitle?.text
        todo.userId = self.viewModel.todo.userId
        self.viewModel.todo = todo
        
        self.showLoadingView(msg: "Sending the todo...".localized)
        self.viewModel.send()
    }
}
