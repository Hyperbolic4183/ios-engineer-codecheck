//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import RealmSwift
import SVProgressHUD


class RepositoryViewController: UIViewController {
    var searchViewController: SearchViewController!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    
    override func viewDidLoad() {//メモリリーク起きてる
        super.viewDidLoad()
        let repositoryList = searchViewController.repositryList
        let image: UIImage = UIImage(url: repositoryList[searchViewController.index].owner.avatar_url ?? "")
        titleLabel.text = repositoryList[searchViewController.index].full_name
        languageLabel.text = "\(repositoryList[searchViewController.index].language ?? "")"
        starsLabel.text = "\(repositoryList[searchViewController.index].stargazers_count ?? 0) stars"
        watchersLabel.text = "\(repositoryList[searchViewController.index].watchers_count ?? 0) watchers"
        forksLabel.text = "\(repositoryList[searchViewController.index].forks_count ?? 0) forks"
        issueLabel.text = "\(repositoryList[searchViewController.index].open_issues ?? 0) open issues"
        iconImageView.image = image
    }
}


