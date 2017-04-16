//
//  ContributionModel.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/09.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit
import Bond

class ContributionModel: NSObject {
    
    dynamic var contributions: [Contribution] = []

    var tempContributions: [Contribution] = []
    
//    let queue1 = DispatchQueue.global(qos: .default)
//    let queue2 = DispatchQueue.global(qos: .default)
//    let group = DispatchGroup()
    
    
    override init(){
        
    }
    
    func fetchContributions(user_id: String, insta_id: String){
        fetchInstagramContributions(user_id: user_id, insta_id: insta_id)
    }

    
    func fetchInstagramContributions(user_id: String, insta_id: String){
        let params: [String: AnyObject] = [
            "access_token": insta_id as AnyObject,
            "count": 30 as AnyObject
        ]
        let url = "https://api.instagram.com/v1/users/self/media/recent/"
        
        Alamofire.request(url, method: .get, parameters: params)
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in
                if let object = response.result.value {
                    let jsonObject = JSON(object)
                    let instaJson = jsonObject["data"].array
                    for insta in instaJson! {
                        if(insta["location"]["name"].string != nil){
                            let contribution = Contribution()
                            contribution.user_id = user_id
                            contribution.name = insta["location"]["name"].string!
                            //画像取得
                            contribution.photo_url = insta["images"]["standard_resolution"]["url"].string!
                            contribution.caption = insta["caption"]["text"].string!
                            contribution.lon = insta["location"]["longitude"].double!
                            contribution.lat = insta["location"]["latitude"].double!
                            contribution.id = insta["id"].string!
                            contribution.photo_id = contribution.id
                            self.contributions.append(contribution)
                        }
                    }
                }
            }
    }
}
