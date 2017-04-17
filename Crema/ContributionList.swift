//
//  ContributionList.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/17.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import ObjectMapper

class ContributionList: Mappable {
    var data: [Contribution] = []
    
    required init(map:Map) {
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }

}
