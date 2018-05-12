//
//  PopularFeedsViewController.swift
//  ForumThreads
//
//  Created by aSqar on 24.11.2017.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import UIKit

class AllPostsViewController : BaseTableViewController<RlmPost, AllPostsViewModel> {
    
    @IBOutlet weak var mySearchBar: UISearchBar?
    
    override var searchBar: UISearchBar?
    {
        return mySearchBar
    }
    
    override func viewDidLoad() {
        self.viewModel = AllPostsViewModel()
        super.viewDidLoad()
        setupSideMenu()
    }
    
    @IBAction func showMenu()
    {
        self.openSideMenu()
    }
    
    override var cellIdentifier : String {
        return "PostCell"
    }
    
    override func setViewModelOwner(owner: UITableViewCell, viewModel: BaseViewModel!) {
        let cell = owner as! PostCell
        let vm = viewModel as! PostViewModel
        cell.setViewModel(viewModel: vm)
    }

    override func showSpinner() {
        self.showLoadingView(msg: "Loading posts...".localized)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        let vm = self.viewModel.selectObjectAtIndexPath(indexPath: indexPath) as! PostCommentsViewModel
        let vc = UIStoryboard(name: "Comments", bundle: nil).instantiateViewController(withIdentifier: "PostCommentsViewController") as! PostCommentsViewController
        vc.viewModel = vm
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat {
        let vm:PostViewModel! = self.viewModel.objectAtIndexPath(indexPath: indexPath)
        
        let width:CGFloat = UIScreen.main.bounds.size.width - 0.0 * 2
        
        let height1:CGFloat = vm.post.body.boundingRect(with: CGSize(width:width, height:CGFloat(MAXFLOAT)), options:NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue), attributes:[kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "HelveticaNeue", size:14.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)], context:nil).size.height
        
        let height2:CGFloat = vm.post.body.boundingRect(with: CGSize(width:width, height:CGFloat(MAXFLOAT)), options:NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue), attributes:[kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "HelveticaNeue", size:12.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)], context:nil).size.height
        
        return 21.0 + height1 + height2
    }
}
