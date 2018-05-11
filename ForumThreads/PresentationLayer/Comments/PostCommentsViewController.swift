//
//  PostCommentsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 11.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class PostCommentsViewController: BaseTableViewController<RlmComment, PostCommentsViewModel> {
    
    @IBOutlet weak var mySearchBar: UISearchBar?
    
    override var searchBar: UISearchBar?
    {
        return mySearchBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var cellIdentifier : String {
        return "CommentCell"
    }
    
    override func setViewModelOwner(owner: UITableViewCell, viewModel: BaseViewModel!) {
        let cell = owner as! CommentCell
        let vm = viewModel as! CommentViewModel
        cell.setViewModel(viewModel: vm)
    }
    
    override func showSpinner() {
        self.showLoadingView(msg: "Loading comments...".localized)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is NewCommentViewController) {
            let vm = self.viewModel.createNewComment()
            let vc = segue.destination as! NewCommentViewController
            vc.viewModel = vm
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    override func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat {
        let vm:CommentViewModel! = self.viewModel.objectAtIndexPath(indexPath: indexPath)
        
        let width:CGFloat = UIScreen.main.bounds.size.width - 0.0 * 2
        
        let height1:CGFloat = vm.comment.name.boundingRect(with: CGSize(width:width, height:CGFloat(MAXFLOAT)), options:NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue), attributes:[kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "HelveticaNeue", size:14.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)], context:nil).size.height
        
        let height2:CGFloat = vm.comment.body.boundingRect(with: CGSize(width:width, height:CGFloat(MAXFLOAT)), options:NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue), attributes:[kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "HelveticaNeue", size:12.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)], context:nil).size.height
        
        return 21.0 + height1 + height2
    }

}
