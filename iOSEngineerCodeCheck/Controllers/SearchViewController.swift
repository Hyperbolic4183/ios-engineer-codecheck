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
    
    var repo: [[String: Any]]=[]
    
    //var task: URLSessionTask?
    var url: String!
    var idx: Int!
    
    var repositoryList : [(full_name: String, name: String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.placeholder = "リポジトリ名を入力してください。"
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
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
            
            let task = session.dataTask(with: request, completionHandler: { (data, response, error ) in
                session.finishTasksAndInvalidate()
                
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(ResultJson.self, from: data!)
                    print(json)
                    if let items = json.items {
                        self.repositoryList.removeAll()
                        for item in items {
                            if let full_name = item.full_name,
                               let name = item.full_name {
                               let repository = (full_name, name)
                               self.repositoryList.append(repository)
                            print(self.repositoryList)
                            }
                        }
                        self.tableView.reloadData()
                      }
                  } catch {
                    print(("エラーが出ました\(error)"))
                  }
                }
                )
            task.resume()
            }
        view.endEditing(true)
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
        return repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Repository", for: indexPath)
        cell.textLabel?.text = repositoryList[indexPath.row].full_name
        return cell
    }
}
