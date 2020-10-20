//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import SVProgressHUD

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var repositoryNameList : [String] = []
    var repositryList: [RequestJson] = []
    var index = 0
    let repositoryViewController = RepositoryViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "リポジトリ名を入力してください。"
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
    }
    //TableViewCellをタップした時の動き
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail"{
            let repositoryViewController = segue.destination as! RepositoryViewController
            repositoryViewController.searchViewController = self
        }
    }
}






