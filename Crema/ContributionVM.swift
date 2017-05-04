//
//  ContributionVM.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/19.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON
import Bond
import PromiseKit

enum RequestListState{
    case none
    case requesting
    case error
}

class ContributionVM: NSObject {
    
    let contributionList = Observable<ContributionList?>(nil)
    let requestListState = Observable<RequestListState>(.none)
    
    
    func fetchContributions(insta_id: String){
        let params: [String: AnyObject] = [
            "access_token": insta_id as AnyObject,
            ]
        let url = "http://160.16.68.195/spot_list_follow.php"
        
        Alamofire.request(url, method: .get, parameters: params)
            .validate { request, response, data in
                return .success
            }
            .responseJSON { response in
                if let object = response.result.value {
                    let mapper = Mapper<ContributionList>()
                    let list = mapper.map(JSONObject: object)
                    self.contributionList.value = list
                    self.requestListState.value = .none
                }
        }
    }

}
