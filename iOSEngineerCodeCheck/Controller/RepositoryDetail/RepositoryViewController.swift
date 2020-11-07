//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
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
    
    var imageURL = ""
    var repositoryName = ""
    var language = ""
    var stars = 0
    var watchers = 0
    var forks = 0
    var issues = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconImageView.image = UIImage(url: imageURL)
        titleLabel.text = repositoryName
        languageLabel.text = "language:\(language)"
        starsLabel.text = "starts:\(stars)"
        watchersLabel.text = "watchers:\(watchers)"
        forksLabel.text = "forks:\(forks)"
        issueLabel.text = "issues:\(issues)"
    }
}


