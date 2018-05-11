//
//  NewCommentViewController.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit
import FormToolbar
import KVNProgress

class NewCommentViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var viewModel : NewCommentViewModel!
    
    @IBOutlet weak var txtName: UITextField?
    @IBOutlet weak var txtEmail: UITextField?
    @IBOutlet weak var textBody: UITextView?
    
    var formToolbar: FormToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.formToolbar = FormToolbar(inputs: [txtName!, txtEmail!, textBody!])
        
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
            self.txtName?.text = self.viewModel.comment.name
            self.txtEmail?.text = self.viewModel.comment.email
            self.textBody?.text = self.viewModel.comment.body
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
        var comment = CommentDto()
        comment.name = txtName?.text
        comment.email = txtEmail?.text
        comment.body = textBody?.text
        comment.postId = self.viewModel.comment.postId
        self.viewModel.comment = comment
        
        self.showLoadingView(msg: "Sending the comment...".localized)
        self.viewModel.send()
    }
}
