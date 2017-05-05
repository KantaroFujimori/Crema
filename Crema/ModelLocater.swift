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
    //dynamic var contributionVM = ContributionVM()
    
    func getUser() -> UserModel {
        return userModel
    }
    
    func setUser(user:UserModel) -> UserModel {
        userModel = user
        return userModel
    }
//    func getContributionVM() -> ContributionVM {
//        return contributionVM
//    }
//    
//    func setContributionVM(contribution:ContributionVM) -> ContributionVM {
//        contributionVM = contribution
//        return contributionVM
//    }
    
    

}
