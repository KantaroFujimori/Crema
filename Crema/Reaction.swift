//
//  Reaction.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/21.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import ObjectMapper

class Reaction: Mappable {
    
    var contributionId: String = ""
    var comment: String = ""
    var userId: String = ""
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        contributionId <- map["contribution_id"]
        comment <- map["comment"]
        userId <- map["user_id"]
    }

}
