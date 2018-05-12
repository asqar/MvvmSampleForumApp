//
//  NewAlbumViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit
import FormToolbar
import KVNProgress

class NewAlbumViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var viewModel : NewAlbumViewModel!
    
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
            self.textTitle?.text = self.viewModel.album.title
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
        var album = AlbumDto()
        album.title = textTitle?.text
        album.userId = self.viewModel.album.userId
        self.viewModel.album = album
        
        self.showLoadingView(msg: "Sending the album...".localized)
        self.viewModel.send()
    }
}
