//
//  ReactionList.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/21.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import ObjectMapper

class ReactionList: Mappable {
    
    var reactions: [Reaction]?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        reactions <- map
    }

}
