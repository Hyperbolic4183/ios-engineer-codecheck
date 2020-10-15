//
//  RepositoryJSONData.swift
//  iOSEngineerCodeCheck
//
//  Created by 大塚周 on 2020/10/14.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import Foundation

struct RequestJson: Codable {
    let full_name: String?
    let language: String?
    let stargazers_count: Int?
    let watchers_count: Int?
    let forks_count: Int?
    let open_issues: Int?
    let owner: Owner
    
    struct Owner: Codable {
        var avatar_url: String?
    }
}

struct ResultJson: Codable {
    let items:[RequestJson]?
}


