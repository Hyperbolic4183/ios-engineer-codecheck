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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritetableView.delegate = self
        favoritetableView.dataSource = self
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
