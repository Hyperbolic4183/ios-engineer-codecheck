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
        let repositoryViewController = segue.destination as! RepositoryViewController
        if segue.identifier == "Detail"{
            repositoryViewController.searchViewController = self
        }
        //詳細画面に値を渡す
        repositoryViewController.imageURL = repositryList[index].owner.avatar_url ?? ""
        repositoryViewController.repositoryName = repositryList[index].full_name ?? ""
        repositoryViewController.language = repositryList[index].language ?? ""
        repositoryViewController.stars = repositryList[index].stargazers_count ?? 0
        repositoryViewController.watchers = repositryList[index].watchers_count ?? 0
        repositoryViewController.forks = repositryList[index].forks_count ?? 0
        repositoryViewController.issues = repositryList[index].open_issues ?? 0
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    //TableViewの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("indexは\(index)")
        print("indexPath.rowは\(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Repository", for: indexPath)
        cell.textLabel?.text = repositryList[indexPath.row].full_name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        //選択されたセルのハイライトを解除
        tableView.deselectRow(at: indexPath, animated: true)
        //画面遷移
        performSegue(withIdentifier: "Detail", sender: nil)
        
        //キーボードを閉じる
        view.endEditing(true)
    }
}





