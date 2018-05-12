//
//  ImageCell.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCell : BaseViewModel {
    
    @IBOutlet weak var imgPhoto: UIImageView?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var progressView: UIProgressView?
    
    var viewModel:ImageViewModel!

    func setViewModel(viewModel:ImageViewModel!) {
        self.viewModel = viewModel

        imgPhoto?.sd_setImage(with: viewModel.url(isThumbnail:true), placeholderImage:UIImage(named: "placeholder.png"),
                                    options:SDWebImageOptions(rawValue: 0), progress:{ (receivedSize,expectedSize,url) in
                                        DispatchQueue.main.async {
                                            self.progressView!.progress = Float(receivedSize / expectedSize)
                                        }
         }, completed:{ (image,error,cacheType,imageURL) in
            self.progressView!.isHidden = true
            })

        lblName?.text = viewModel.caption
    }
}
