//
//  SearchRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 大塚周 on 2020/10/19.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import SVProgressHUD

extension SearchViewController {
    
    //SearchBarに入力された単語をURLに入れ,検索し,TableViewを更新する関数
    func searchRepository(searchWord: String) {
        //インジケータの表示
        SVProgressHUD.show()
        guard let requestURL = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)") else { return }
        print("\(requestURL)をリクエストした")
        let request = URLRequest(url: requestURL)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request, completionHandler: { [self] (data, response, error ) in
            session.finishTasksAndInvalidate()
            do {
                try getAPI(data: data)
                //インジケータの消去
                SVProgressHUD.dismiss()
                tableView?.reloadData()
            } catch {
                SVProgressHUD.showError(withStatus: "エラーが発生しました。")
                print(("エラーが出ました\(error)"))
            }
        }
        )
        task.resume()
    }
    
    //取得したjsonデータをdecodeし,そこに含まれているfull_nameを格納する関数
    func getAPI(data: Data?) throws {
        let decoder = JSONDecoder()
        let json = try decoder.decode(ResultJson.self, from: data!)
        self.repositryList = json.items ?? []
        if let items = json.items {
            self.repositryList.removeAll()
            self.repositryList.append(contentsOf: items)
        }
    }
}
