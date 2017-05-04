//
//  Upload.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/09.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import NCMB

class Upload: NSObject {

    var contribution: Contribution
    
    init(contribution: Contribution){
        self.contribution = contribution
    }
    
    func save() {
//        let url = URL(string: contribution.photo_url)
//        let targetFile: NCMBFile
//        
//        //投稿データを保存
//        let uploadObject = NCMBObject(className: "contributions")
//        uploadObject?.setObject(contribution.user_id, forKey: "user_id")
//        uploadObject?.setObject(contribution.genre, forKey: "genre")
//        uploadObject?.setObject(contribution.photo_id, forKey: "photo_id")
//        uploadObject?.setObject(contribution.photo_url, forKey: "photo_url")
//        uploadObject?.setObject(contribution.name, forKey: "spot_name")
//        uploadObject?.setObject(contribution.caption, forKey: "caption")
//        uploadObject?.setObject(contribution.lat, forKey: "lat")
//        uploadObject?.setObject(contribution.lon, forKey: "lon")
//        uploadObject?.setObject(contribution.id, forKey: "insta_id")
//        uploadObject?.setObject(contribution.spot_id, forKey: "spot_id")
//        uploadObject?.saveInBackground { (error) in
//            if error == nil {
//                print("saved!")
//            }else{
//                print("save failed")
//            }
//        }
//        //画像保存
//        do{
//            let imgName = self.contribution.id
//            let imgData: Data = try Data(contentsOf: url!)
//            targetFile = NCMBFile.file(withName: imgName, data: imgData as Data!) as! NCMBFile
//            targetFile.saveInBackground({(error) -> Void in
//                if error == nil {
//                    print("saved : \(targetFile.name)")
//                } else {
//                    print("save failed: \(error) + \(targetFile.name)")
//                }
//                
//            }, progressBlock: { (percentDone: Int32) -> Void in
//                
//                // 進捗状況を取得します。保存完了まで何度も呼ばれます
//                //print("progress: \(percentDone)% uploading")
//            })
//        }catch{
//            print("convert file error")
//        }
        
    }

}
