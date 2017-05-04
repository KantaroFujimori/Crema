//
//  JenreConverter.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/05/01.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class JenreConverter: NSObject {
    
    func convert(types: [String]) -> String {
        if(types.count == 0){
            return "default"
        }
        
        if(types.contains("cafe")){
            return "cafe"
        }else if(types.contains("food") || types.contains("restaurant") || types.contains("bar")){
            return "restaurant"
        }else{
            return "default"
        }
    }
}
