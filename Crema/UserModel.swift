//
//  UserModel.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/04.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import NCMB

class UserModel: NSObject {
    
    dynamic var user = User()
    
    override init(){
        
    }
    
    //get user data
    func fetchUserData(id: String){
        let query = NCMBQuery(className: "users")
        /** 条件を入れる場合はここに書きます **/
        query?.whereKey("user_id", equalTo: id)
        // データストアの検索を実施
        query?.findObjectsInBackground({(objects, error) in
            if (error != nil){
                // 検索失敗時の処理
                print("no data")
            }else{
                // 検索成功時の処理
                if (objects?.count)! > 0 {
                    for obj in objects! {
                        let data = obj as AnyObject
                        if !(data.object(forKey: "user_id") is NSNull){
                            self.user.id = data.object(forKey: "user_id") as! String
                        }
                        if !(data.object(forKey: "insta_id") is NSNull){
                            self.user.insta_id = data.object(forKey: "insta_id") as! String
                        }
                        if !(data.object(forKey: "name") is NSNull){
                            self.user.name = data.object(forKey: "name") as! String
                        }
                        
                    }
                }
            }
        })
    }
    

}
