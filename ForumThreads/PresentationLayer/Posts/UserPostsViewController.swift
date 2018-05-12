//
//  UserPostsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class UserPostsViewController : PostListViewController<UserPostsViewModel> {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is NewPostViewController) {
            let vm = self.viewModel.createNewPost()
            let vc = segue.destination as! NewPostViewController
            vc.viewModel = vm
        }
    }
}
