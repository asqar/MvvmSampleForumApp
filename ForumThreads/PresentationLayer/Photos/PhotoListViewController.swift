//
//  PhotoListViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit
import MWPhotoBrowser

class PhotoListViewController<VM : PhotoListViewModel>: BaseCollectionViewController<RlmPhoto, VM>, MWPhotoBrowserDelegate {
    
    deinit {
        _photoBrowser?.delegate = nil
        _photoBrowser = nil
    }
    
    private var _photoBrowser:MWPhotoBrowser!
    
    var photoBrowser:MWPhotoBrowser! {
        get {
            if _photoBrowser == nil {
                _photoBrowser = MWPhotoBrowser(delegate:self)
                _photoBrowser.view.backgroundColor = UIColor.black
                _photoBrowser.displayActionButton = false
                _photoBrowser.alwaysShowControls = true
                _photoBrowser.zoomPhotosToFill = true
                _photoBrowser.edgesForExtendedLayout = UIRectEdge()
                _photoBrowser.extendedLayoutIncludesOpaqueBars = false
            }
            return _photoBrowser
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        _photoBrowser?.delegate = nil
        _photoBrowser = nil
    }
    
    override var cellIdentifier : String {
        return "PhotoCell"
    }
    
    override func setViewModelOwner(owner: UICollectionViewCell, viewModel: BaseViewModel!) {
        let cell = owner as! PhotoCell
        let vm = viewModel as! PhotoViewModel
        cell.setViewModel(viewModel: vm)
    }
    
    override func showSpinner() {
        self.showLoadingView(msg: "Loading photos...".localized)
    }
    
    override func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath) {
        super.collectionView(collectionView, didSelectItemAt: indexPath)
        self.photoBrowser.setCurrentPhotoIndex(UInt(indexPath.row))
        self.navigationController!.pushViewController(self.photoBrowser, animated:true)
        self.collectionView?.deselectItem(at: indexPath, animated:true)
    }
    
    // MARK: - MWPhotoProwser delegate
    
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        let i:UInt = UInt(self.viewModel.numberOfItemsInSection(section: 0))
        return i
    }
    
    func photoBrowser(_ photoBrowser:MWPhotoBrowser!, photoAt index:UInt) -> MWPhotoProtocol! {
        if index < self.viewModel.numberOfItemsInSection(section: 0) {
            let photoViewModel:PhotoViewModel! = self.viewModel.objectAtIndexPath(indexPath: NSIndexPath.init(row: Int(index), section:0) as IndexPath?)
            let photoObj:MWPhoto! = MWPhoto(url: URL(string: photoViewModel.photo.url))
            photoObj.caption = photoViewModel.photo.title
            return photoObj
        }
        return nil
    }

    
}
