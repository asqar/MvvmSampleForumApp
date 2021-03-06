//
//  AlbumListViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class AlbumListViewController<VM : AlbumListViewModel>: BaseTableViewController<RlmAlbum, VM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var cellIdentifier : String {
        return "AlbumCell"
    }
    
    override func setViewModelOwner(owner: UITableViewCell, viewModel: BaseViewModel!) {
        let cell = owner as! AlbumCell
        let vm = viewModel as! AlbumViewModel
        cell.setViewModel(viewModel: vm)
    }
    
    override func showSpinner() {
        self.showLoadingView(msg: "Loading albums...".localized)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        let vm = self.viewModel.selectObjectAtIndexPath(indexPath: indexPath) as! AlbumPhotosViewModel
        let vc = UIStoryboard(name: "Photos", bundle: nil).instantiateViewController(withIdentifier: "AlbumPhotosViewController") as! AlbumPhotosViewController
        vc.viewModel = vm
        self.navigationController?.pushViewController(vc, animated: true)
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat {
        let vm:AlbumViewModel! = self.viewModel.objectAtIndexPath(indexPath: indexPath)
        
        let width:CGFloat = UIScreen.main.bounds.size.width - 0.0 * 2
        
        let height:CGFloat = vm.album.title.boundingRect(with: CGSize(width:width, height:CGFloat(MAXFLOAT)), options:NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue), attributes:[kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "HelveticaNeue", size:14.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)], context:nil).size.height
        
        return height + 20
    }
    
}

