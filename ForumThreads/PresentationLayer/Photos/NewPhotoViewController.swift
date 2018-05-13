//
//  NewPhotoViewController.swift
//  ForumThreads
//
//  Created by aSqar on 13.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit
import FormToolbar
import KVNProgress

class NewPhotoViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var viewModel : NewPhotoViewModel!
    
    @IBOutlet weak var textTitle: UITextView?
    
    var formToolbar: FormToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.formToolbar = FormToolbar(inputs: [ textTitle!])
        
        self.viewModel.updatedContentSignal.subscribeNext({ (x) in
            self.refresh()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.textTitle?.becomeFirstResponder()
    }
    
    func refresh() {
        if viewModel.isSaved
        {
            self.hideLoadingView()
            KVNProgress.showSuccess()
            self.navigationController?.popViewController(animated: true)
        } else {
            self.textTitle?.text = self.viewModel.photo.title
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
        var photo = PhotoDto()
        photo.title = textTitle?.text
        photo.albumId = self.viewModel.photo.albumId
        self.viewModel.photo = photo
        
        self.showLoadingView(msg: "Sending the photo...".localized)
        self.viewModel.send()
    }
}
