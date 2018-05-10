//
//  UIViewController+LoadingView.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit
import KVNProgress

extension UIViewController {

    func showLoadingView(msg:String!) {
        KVNProgress.show(withStatus: msg)
    }

    func hideLoadingView() {
        KVNProgress.dismiss()
    }
}
