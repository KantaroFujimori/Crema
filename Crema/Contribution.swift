//
//  Contributions.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/19.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class Contribution: Mappable {
    
    var id: String = ""
    var userId: String = ""
    var userName: String = ""
    var userProfileUrl: String = ""
    var thumbnail: String = ""
    var rawImage: String = ""
    var standardImage: String = ""
    var caption: String = ""
    var tags: [String] = []
    var instaLat: Double = 0
    var instaLon: Double = 0
    var spotInstaName: String = ""
    var spotInstaId: String = ""
    var lat: Double = 0
    var lon: Double = 0
    var spotGoogleId: String = ""
    var spotGoogleName: String = ""
    var types: [String] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["user.id"]
        userName <- map["user.username"]
        userProfileUrl <- map["user.profile_picture"]
        thumbnail <- map["images.thumbnail.url"]
        rawImage <- map["images.low_resolution.url"]
        standardImage <- map["images.standard_resolution.url"]
        caption <- map["caption.text"]
        tags <- map["tags"]
        instaLat <- map["location.latitude"]
        instaLon <- map["location.longitude"]
        spotInstaName <- map["location.name"]
        spotInstaId <- map["location.id"]
        lat <- map["google_place.geometry.location.lat"]
        lon <- map["google_place.geometry.location.lon"]
        spotGoogleId <- map["google_place.id"]
        spotGoogleName <- map["google_place.name"]
        types <- map["google_place.types"]
    }

}
