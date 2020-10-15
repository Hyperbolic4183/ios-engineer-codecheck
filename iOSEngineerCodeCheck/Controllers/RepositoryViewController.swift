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
        let repositoryList = searchViewController.repositryList
        print("Written in \(searchViewController.index)")
        print("Written in \(repositoryList[searchViewController.index].stargazers_count ?? 0)")
        print("Written in \(repositoryList[searchViewController.index].watchers_count ?? 0)")
        print("Written in \(searchViewController.index)")
        print("Written in \(searchViewController.index)")
        
        titleLabel.text = repositoryList[searchViewController.index].full_name
        languageLabel.text = "\(repositoryList[searchViewController.index].language ?? "")"
        starsLabel.text = "\(repositoryList[searchViewController.index].stargazers_count ?? 0) stars"
        watchersLabel.text = "\(repositoryList[searchViewController.index].watchers_count ?? 0) watchers"
        forksLabel.text = "\(repositoryList[searchViewController.index].forks_count ?? 0) forks"
        issueLabel.text = "\(repositoryList[searchViewController.index].open_issues ?? 0) open issues"
//        getImage()
        
    }
    
//    func getImage(){
//
//        let repo = searchViewController.repo[searchViewController.idx]
//
//        titleLabel.text = repo["full_name"] as? String
//
//        if let owner = repo["owner"] as? [String: Any] {
//            if let imgURL = owner["avatar_url"] as? String {
//                URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
//                    let img = UIImage(data: data!)!
//                    DispatchQueue.main.async {
//                        self.iconImageView.image = img
//                    }
//                }.resume()
//            }
//        }
//
//    }
    
}
