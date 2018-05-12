//
//  ImageCell.swift
//  ForumThreads
//
//  Created by aSqar on 08.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell : BaseCollectionViewCell<PhotoViewModel> {
    
    @IBOutlet weak var imgPhoto: UIImageView?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var progressView: UIProgressView?

    override func setViewModel(viewModel: PhotoViewModel!) {
        super.setViewModel(viewModel: viewModel)
    }
    
    override func refresh(){
        imgPhoto?.sd_setImage(with: URL(string: self.viewModel.photo.thumbnailUrl), placeholderImage:UIImage(named: "placeholder.png"),
                                    options:SDWebImageOptions(rawValue: 0), progress:{ (receivedSize,expectedSize,url) in
                                        DispatchQueue.main.async {
                                            self.progressView!.progress = Float(receivedSize / expectedSize)
                                        }
         }, completed:{ (image,error,cacheType,imageURL) in
            self.progressView!.isHidden = true
            })

        lblName?.text = self.viewModel.photo.title
    }
}
