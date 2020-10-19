//
//  SearchRipository.swift
//  iOSEngineerCodeCheck
//
//  Created by 大塚周 on 2020/10/19.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

extension SearchViewController{
    func test(searchWord: String) {
        guard let requestURL = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)") else { return }
        print("\(requestURL)をリクエストした")
        let request = URLRequest(url: requestURL)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request, completionHandler: { [self] (data, response, error ) in
            session.finishTasksAndInvalidate()
            do {
                try searchRipository(data: data)
                tableView?.reloadData()
            } catch {
                print(("エラーが出ました\(error)"))
            }
        }
        )
        task.resume()
    }
    
    //取得したjsonデータをdecodeし,そこに含まれているfull_nameを格納し,tableViewを更新する関数
    func searchRipository(data: Data?) throws {
        let decoder = JSONDecoder()
        let json = try decoder.decode(ResultJson.self, from: data!)
        print(json)//テスト
        self.repositryList = json.items ?? []
        if let items = json.items {
            self.repositoryNameList.removeAll()
            for item in items {
                if let full_name = item.full_name {
                    self.repositoryNameList.append(full_name)
                    print(self.repositoryNameList)
                }
            }
        }
    }
}
