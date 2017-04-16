//
//  SpotDetailViewController.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/13.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class SpotDetailViewController: UIViewController {
    
    var contribution = Contribution()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(contribution.name)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        ModelLocater.sharedInstance.getUser().user.addObserver(self, forKeyPath: "id", options: .new, context: nil)
//        ModelLocater.sharedInstance.getUser().fetchUserData(id: userId)
        
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        ModelLocater.sharedInstance.getUser().user.removeObserver(self, forKeyPath: "id")
//        ModelLocater.sharedInstance.getContribution().removeObserver(self, forKeyPath: "contributions")
//    }
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if(keyPath == "id"){
//            
//        }else if(keyPath == "contributions"){
//            self.contributions = change![.newKey] as! [Contribution]
//            for con in self.contributions{
//                self.createPin(contribution: con)
//                //                let uploadSpot = Upload(contribution: con)
//                //                uploadSpot.save()
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
