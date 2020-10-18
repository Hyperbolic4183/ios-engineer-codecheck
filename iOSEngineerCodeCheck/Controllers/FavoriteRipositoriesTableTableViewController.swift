//
//  FavoriteRipositoriesTableTableViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 大塚周 on 2020/10/16.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class FavoriteRipositoriesTableTableViewController: UITableViewController {

    
    @IBOutlet var favoritetableView: UITableView!
    let repositoryViewController = RepositoryViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritetableView.delegate = self
        favoritetableView.dataSource = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repositoryViewController.favoriteRipositoryArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "あい"
        return cell
    }
}
