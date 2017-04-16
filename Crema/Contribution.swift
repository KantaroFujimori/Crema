//
//  contribution.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/09.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

protocol contributionProtocol {
    var id: String { get set }
    var spot_id: String { get set }
    var user_id: String { get set }
    var photo_id: String { get set }
    var photo_url: String { get set }
    var caption: String { get set }
    var lat: Double { get set }
    var lon: Double { get set }
    var genre: [String] { get set }
    var name: String { get set }
}

class Contribution: NSObject, contributionProtocol {
    
    var id: String = ""
    var spot_id: String = ""
    var user_id: String = ""
    var photo_id: String = ""
    var photo_url: String = ""
    var caption: String = ""
    var lat: Double = 0
    var lon: Double = 0
    var genre: [String] = []
    var name: String = ""
}
