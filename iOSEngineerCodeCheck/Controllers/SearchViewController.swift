//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var repositoryNameList : [String] = []
    var repositryList: [RequestJson] = []
    var index = 0
    let repositoryViewController = RepositoryViewController()
    
    override func viewDidLoad()       {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.placeholder = "リポジトリ名を入力してください。"
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //task?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchWord = searchBar.text {
            print("検索したリポジトリ名は\(searchBar)")
            guard let requestURL = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)") else { return }
            print("\(requestURL)をリクエストした")
            let request = URLRequest(url: requestURL)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request, completionHandler: { [self] (data, response, error ) in
                session.finishTasksAndInvalidate()
                do {
                    searchRipository(data: data)
                } catch {
                    print(("エラーが出ました\(error)"))
                }
            }
            )
            task.resume()
        }
        
        view.endEditing(true)
    }
    
    func searchRipository(data: Data?) {
        let decoder = JSONDecoder()
        let json = try! decoder.decode(ResultJson.self, from: data!)
        print(json)
        self.repositryList = json.items ?? []
        if let items = json.items {
            self.repositoryNameList.removeAll()
            for item in items {
                if let full_name = item.full_name {
                    self.repositoryNameList.append(full_name)
                    print(self.repositoryNameList)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail"{
            let dtl = segue.destination as! RepositoryViewController
            dtl.searchViewController = self
        }
        
        
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Repository", for: indexPath)
        cell.textLabel?.text = repositoryNameList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detail", sender: nil)
        index = indexPath.row
        view.endEditing(true)
    }
    
    
    
}
