//
//  NewPostViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit
import FormToolbar
import KVNProgress

class NewPostViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var viewModel : NewPostViewModel!
    
    @IBOutlet weak var txtTitle: UITextField?
    @IBOutlet weak var textBody: UITextView?
    
    var formToolbar: FormToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.formToolbar = FormToolbar(inputs: [txtTitle!, textBody!])
        
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
            self.txtTitle?.text = self.viewModel.post.title
            self.textBody?.text = self.viewModel.post.body
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
        var post = PostDto()
        post.title = txtTitle?.text
        post.body = textBody?.text
        self.viewModel.post = post
        
        self.showLoadingView(msg: "Sending the post...".localized)
        self.viewModel.send()
    }
}
