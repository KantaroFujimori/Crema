//
//  ModelLocater.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/08.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class ModelLocater: NSObject {
    
    class var sharedInstance: ModelLocater {
        struct Singleton {
            static let instance: ModelLocater = ModelLocater()
        }
        return Singleton.instance
    }
    
    dynamic var userModel = UserModel()
    dynamic var contributionModels = ContributionModel()
    dynamic var gAPISpotModel = GAPISpotModel()
    
    func getUser() -> UserModel {
        return userModel
    }
    
    func setUser(user:UserModel) -> UserModel {
        userModel = user
        return userModel
    }
    
    func getContribution() -> ContributionModel {
        return contributionModels
    }
    
    func setContribution(array:ContributionModel) -> ContributionModel {
        contributionModels = array
        return contributionModels
    }
    
    func getGAPISpotModel() -> GAPISpotModel {
        return gAPISpotModel
    }
    
    func setGAPISpotModel(gAPISpot:GAPISpotModel) -> GAPISpotModel {
        gAPISpotModel = gAPISpot
        return gAPISpotModel
    }
    
    

}
