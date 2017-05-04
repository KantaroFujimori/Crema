//
//  PinCMView.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/05/01.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class PinCMView: UIView {

    var jenreIcon = UIImageView()
    var userIcon = UIImageView()
    var contributionId = ""
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        
        userIcon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        jenreIcon.frame = CGRect(x: 6, y: 6, width: 26, height: 26)
        userIcon.layer.masksToBounds = true
        jenreIcon.layer.masksToBounds = true
        
        self.addSubview(jenreIcon)
        self.addSubview(userIcon)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        userIcon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        jenreIcon.frame = CGRect(x: 6, y: 6, width: 26, height: 26)
        userIcon.layer.masksToBounds = true
        jenreIcon.layer.masksToBounds = true
        
        self.addSubview(jenreIcon)
        self.addSubview(userIcon)
    }
}
