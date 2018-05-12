//
//  UserTodosViewController.swift
//  ForumThreads
//
//  Created by aSqar on 12.05.2018.
//  Copyright © 2018 Askar Bakirov. All rights reserved.
//

import Foundation
import UIKit

class UserTodosViewController: BaseTableViewController<RlmTodo, UserTodosViewModel> {
    
    @IBOutlet weak var mySearchBar: UISearchBar?
    
    override var searchBar: UISearchBar?
    {
        return mySearchBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var cellIdentifier : String {
        return "TodoCell"
    }
    
    override func setViewModelOwner(owner: UITableViewCell, viewModel: BaseViewModel!) {
        let cell = owner as! TodoCell
        let vm = viewModel as! TodoViewModel
        cell.setViewModel(viewModel: vm)
    }
    
    override func showSpinner() {
        self.showLoadingView(msg: "Loading todos...".localized)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is NewTodoViewController) {
            let vm = self.viewModel.createNewTodo()
            let vc = segue.destination as! NewTodoViewController
            vc.viewModel = vm
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    override func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) -> CGFloat {
        let vm:TodoViewModel! = self.viewModel.objectAtIndexPath(indexPath: indexPath)
        
        let width:CGFloat = UIScreen.main.bounds.size.width - 0.0 * 2
        
        let height:CGFloat = vm.todo.title.boundingRect(with: CGSize(width:width, height:CGFloat(MAXFLOAT)), options:NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue), attributes:[kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "HelveticaNeue", size:14.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)], context:nil).size.height
        
        return height
    }
    
}

