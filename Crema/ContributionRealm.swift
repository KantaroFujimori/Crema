//
//  ContributionRealm.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/05/04.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import RealmSwift

class ContributionRealm: Object {
    
    dynamic var id = ""
    dynamic var userId: String = ""
    dynamic var userName: String = ""
    dynamic var userProfileUrl: String = ""
    dynamic var thumbnail: String = ""
    dynamic var rawImage: String = ""
    dynamic var standardImage: String = ""
    dynamic var caption: String = ""
    //dynamic var tags: [AnyObject] = []
    dynamic var instaLat: Double = 0
    dynamic var instaLon: Double = 0
    dynamic var spotInstaName: String = ""
    dynamic var spotInstaId: String = ""
    dynamic var lat: Double = 0
    dynamic var lon: Double = 0
    dynamic var spotGoogleId: String = ""
    dynamic var spotGoogleName: String = ""
    dynamic var types: TypesRealm?
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
