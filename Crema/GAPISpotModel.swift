//
//  GAPISpotModel.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/10.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GAPISpotModel: NSObject {
    
//    dynamic var contribution = Contribution()
//    
//    override init(){
//        
//    }
//    
//    func getSpotInfo(contribution: Contribution){
//        self.getSpotInfoFromGAPI(contribution: contribution)
//    }
//    
//    func getSpotInfoFromGAPI(contribution: Contribution){
//        
//        let key: String = "AIzaSyBgPBIe6l6684PXMSz0N67fDIjkFVfd-5M"
//        let lat: String = (contribution.lat.description)
//        let lon: String = (contribution.lon.description)
//        let location = lat + "," + lon
//        let radius = 500
//        let params: [String: AnyObject] = [
//            "name": contribution.name as AnyObject,
//            "key": key as AnyObject,
//            "location": location as AnyObject,
//            "radius": radius as AnyObject
//        ]
//        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
//        Alamofire.request(url, method: .get, parameters: params)
//            .validate { request, response, data in
//                return .success
//            }
//            .responseJSON { response in
//                if let object = response.result.value {
//                    let jsonObject = JSON(object)
//                    let spotJson = jsonObject["results"].array
//                    if (spotJson!.count) > 0{
//                        let spot = spotJson?[0]
//                        contribution.google_spot_id = (spot?["place_id"].string)!
//                        contribution.genre = (spot?["types"].arrayObject as! [String]?)!
//                        //print("spot_id: " + contribution.spot_id)
//                    }else{
//                        contribution.google_spot_id = ""
//                        contribution.genre[0] = "default"
//                    }
//                }
//            }
//    }
    

}
