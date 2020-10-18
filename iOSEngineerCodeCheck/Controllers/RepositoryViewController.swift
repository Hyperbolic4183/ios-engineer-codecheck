//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import RealmSwift

class RepositoryViewController: UIViewController {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    
    var searchViewController: SearchViewController!
    var ripositoryTitle = ""//リポジトリを一意に定めるもの
    
    let realm = try! Realm()
    var favoriteRipository = FavoriteRipository()
    var favoriteRipositoryArray = try! Realm().objects(FavoriteRipository.self)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let repositoryList = searchViewController.repositryList
        ripositoryTitle = repositoryList[searchViewController.index].full_name ?? ""
        print("タイトルは\(ripositoryTitle)")
        let image: UIImage = UIImage(url: repositoryList[searchViewController.index].owner.avatar_url ?? "")
        
        titleLabel.text = repositoryList[searchViewController.index].full_name
        languageLabel.text = "\(repositoryList[searchViewController.index].language ?? "")"
        starsLabel.text = "\(repositoryList[searchViewController.index].stargazers_count ?? 0) stars"
        watchersLabel.text = "\(repositoryList[searchViewController.index].watchers_count ?? 0) watchers"
        forksLabel.text = "\(repositoryList[searchViewController.index].forks_count ?? 0) forks"
        issueLabel.text = "\(repositoryList[searchViewController.index].open_issues ?? 0) open issues"
        iconImageView.image = image
    }
    //お気に入りに追加されたものの中に含まれていた時,favoriteBoolをtrueにする関数
    func favoritedJudge() {
        
    }
    
    //    @IBAction func favoriteButton(_ sender: Any) {
    //        favoriteButton.isSelected = !favoriteButton.isSelected
    //        print(favoriteButton.isSelected)
    //        favoriteButtonImage()
    //    }
    
    //    func favoriteButtonImage() {
    //        if favoriteButton.isSelected {
    //            print("お気に入りに追加")
    //            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    //            print("プライマリキーは\(favoriteRipository.id)")
    //            try! realm.write {
    //                self.favoriteRipository.repository = ripositoryTitle
    //                self.favoriteRipository.id = favoriteRipositoryArray.max(ofProperty: "id") ?? 0 + 1
    //                self.realm.add(self.favoriteRipository, update: .modified)
    //                print("配列の数は\(favoriteRipositoryArray.count)")
    //                print("配列は\(favoriteRipositoryArray)")
    //            }
    //        } else {
    //            print("お気に入りから削除")
    //            guard let results = realm.objects(FavoriteRipository.self).filter("repository == '\(ripositoryTitle)'").first else { return }
    //            try! realm.write{
    //                realm.delete(results)
    //            }
    //            print("配列の数は\(favoriteRipositoryArray.count)")
    //            print("配列は\(favoriteRipositoryArray)")
    //
    //        }
    //    }
}

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
