//
//  Types.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/05/05.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import RealmSwift

class Types: NSObject {
    
    static func initializeObject(id: String, type: String) -> TypesRealm{
        let types = TypesRealm()
        types.id = id
        types.type = type
        return types;
    }

}
