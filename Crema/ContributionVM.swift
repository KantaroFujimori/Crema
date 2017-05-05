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
import RealmSwift

enum RequestListState{
    case none
    case requesting
    case error
}

class ContributionVM {
    
    var contributionList = MutableObservableArray([ContributionRealm]())
    var requestListState = Observable<RequestListState>(.none)
    var notificationToken: NotificationToken?
    
    init(){
        let contribution = Contribution.getAll()
        print("contributionVM init")
        
        notificationToken = contribution.addNotificationBlock( { [weak self] (changes:  RealmCollectionChange) in
            switch changes {
            case .initial(_):
                var tmpArray: [ContributionRealm] = []
                contribution.forEach{(con) -> Void in
                    self?.contributionList.append(con)
                }
                break
                
            case .update(_,_,_,_):
                
                break
                
            case .error(let error):
                fatalError("\(error)")
                break
            }
        })
    }
    func fetch(instaId: String){
        Contribution.fetch(instaId: instaId)
    }

}
