//
//  FavoriteRipositoryData.swift
//  iOSEngineerCodeCheck
//
//  Created by 大塚周 on 2020/10/17.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import RealmSwift

class FavoriteRipository: Object {
    @objc dynamic var repository = ""
    override static func primaryKey() -> String? {
        return "repository"
    }
}
