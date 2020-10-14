//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    
    var searchViewController: SearchViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = searchViewController.repo[searchViewController.idx]
        
        languageLabel.text = "Written in \(repo["language"] as? String ?? "")"
        starsLabel.text = "\(repo["stargazers_count"] as? Int ?? 0) stars"
        watchersLabel.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
        forksLabel.text = "\(repo["forks_count"] as? Int ?? 0) forks"
        issueLabel.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
        getImage()
        
    }
    
    func getImage(){
        
        let repo = searchViewController.repo[searchViewController.idx]
        
        titleLabel.text = repo["full_name"] as? String
        
        if let owner = repo["owner"] as? [String: Any] {
            if let imgURL = owner["avatar_url"] as? String {
                URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
                    let img = UIImage(data: data!)!
                    DispatchQueue.main.async {
                        self.iconImageView.image = img
                    }
                }.resume()
            }
        }
        
    }
    
}
