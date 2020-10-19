//
//  ImageExtension.swift
//  iOSEngineerCodeCheck
//
//  Created by 大塚周 on 2020/10/19.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
//URLから画像を取得できるようにUIImageを拡張
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
