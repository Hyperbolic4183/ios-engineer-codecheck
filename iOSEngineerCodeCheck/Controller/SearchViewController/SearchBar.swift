//
//  SearchBar.swift
//  iOSEngineerCodeCheck
//
//  Created by 大塚周 on 2020/10/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import SVProgressHUD
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }
    
    //Enterを押した時の動き
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchWord = searchBar.text {
            searchRepository(searchWord: searchWord)
        } else {
            SVProgressHUD.showError(withStatus: "リポジトリを名を入力してください。")
        }
        view.endEditing(true)
    }
}
