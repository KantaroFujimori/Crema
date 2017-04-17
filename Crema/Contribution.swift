//
//  contribution.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/09.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import ObjectMapper

class Contribution: Mappable {
    
    var id: String?
    var spot_id: String?
    var user_id: String?
    var photo_id: String?
    var photo_url: String?
    var caption: String?
    var lat: Double?
    var lon: Double?
    var genre: [String]?
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        spot_id <- map["location"]["id"]
        user_id <- map["user"]["id"]
        photo_id <- map["id"]
        photo_url <- map["images"]["standard_resolution"]["url"]
        caption <- map["caption"]["text"]
        lat <- map["location"]["latitude"]
        lon <- map["location"]["longitude"]
        genre <- map["tags"]
        name <- map["user"]["username"]
        
    }
}
