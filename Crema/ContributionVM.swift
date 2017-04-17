//
//  ContributionVM.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/17.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import Bond
import Alamofire
import SwiftyJSON
import ObjectMapper

class ContributionVM {
    
    enum RequestState {
        case None
        case Requesting
        case Finish
    }
    
    let requestState = Observable<RequestState>(.None)
    fileprivate var contributionList = MutableObservableArray<Contribution>([])
    
    func fetchContribution(user_id: String, insta_id: String){
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
                    
                    let contributions = ContributionList(map: object as! Map)
                    for con in contributions.data{
                        self.contributionList.append(con)
                    }
                    
                }
                
                
        }
    }
    
    

}
