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
import RealmSwift
import SwiftyJSON

class Contribution: NSObject {
    
    static let url = "http://160.16.68.195/spot_list_follow.php"
    
    static func initializeObject(
        id: String,
        userId: String,
        userName: String,
        userProfileUrl: String,
        thumbnail: String,
        rawImage: String,
        standardImage: String,
        caption: String,
        //tags: [AnyObject],
        instaLat: Double,
        instaLon: Double,
        spotInstaName: String,
        spotInstaId: String,
        lat: Double,
        lon: Double,
        spotGoogleId: String,
        spotGoogleName: String,
        types: TypesRealm) -> ContributionRealm {
        
        let contribution = ContributionRealm()
        contribution.id = id
        contribution.userId = userId
        contribution.userName = userName
        contribution.userProfileUrl = userProfileUrl
        contribution.thumbnail = thumbnail
        contribution.rawImage = rawImage
        contribution.standardImage = standardImage
        contribution.caption = caption
        //contribution.tags = tags
        contribution.instaLat = instaLat
        contribution.instaLon = instaLon
        contribution.spotInstaName = spotInstaName
        contribution.spotInstaId = spotInstaId
        contribution.lat = lat
        contribution.lon = lon
        contribution.spotGoogleId = spotGoogleId
        contribution.spotGoogleName = spotGoogleName
        contribution.types = types
    
        return contribution
    }
    
    static func getAll() -> Results<ContributionRealm>{
        let realm = try! Realm()
        return realm.objects(ContributionRealm.self).sorted(byKeyPath: "id", ascending: false)
    }
    
    static func fetch(instaId: String) {
        let params: [String: AnyObject] = [
            "access_token": instaId as AnyObject,
            ]
        
        Alamofire.request(url, method: .get, parameters: params)
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in
                guard let res = response.result.value else {
                    return
                }
                
                let realm = try! Realm()
                let jsonResponse = JSON(res)
                let jsonResponseArray = jsonResponse["data"]
                
                realm.beginWrite()
                // 削除
                let contribution = realm.objects(ContributionRealm.self)
                realm.delete(contribution)
                
                // 作成
                jsonResponseArray.forEach { (_, json) in
                    var type = TypesRealm()
                    if let types = json["google_place"]["type"].arrayObject as? [String]{
                         type = Types.initializeObject(
                            id: json["google_place"]["id"].stringValue,
                            type: types[0])
                    }
                    
                    let contribution = self.initializeObject(
                        id: json["id"].stringValue,
                        userId: json["user"]["id"].stringValue,
                        userName: json["user"]["username"].stringValue,
                        userProfileUrl: json["user"]["profile_picture"].stringValue,
                        thumbnail: json["images"]["thumbnail"]["url"].stringValue,
                        rawImage: json["images"]["rawImage"]["url"].stringValue,
                        standardImage: json["images"]["standardImage"]["url"].stringValue,
                        caption: json["caption"]["text"].stringValue,
                        //tags: json["tags"].arrayValue,
                        instaLat: json["location"]["latitude"].doubleValue,
                        instaLon: json["location"]["longitude"].doubleValue,
                        spotInstaName: json["location"]["name"].stringValue,
                        spotInstaId: json["location"]["id"].stringValue,
                        lat: json["google_place"]["geometry"]["location"]["lat"].doubleValue,
                        lon: json["google_place"]["geometry"]["location"]["lng"].doubleValue,
                        spotGoogleId: json["google_place"]["id"].stringValue,
                        spotGoogleName: json["google_place"]["name"].stringValue,
                        types: type)
                    
                    realm.add(contribution, update: true)
                    
                }
                try! realm.commitWrite()
        }
    }

}
