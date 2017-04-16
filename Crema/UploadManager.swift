//
//  Uploadmanager.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/09.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class UploadManager: NSObject {
    static let sharedInstance = UploadManager()
    var upload: [Upload] = []
}
