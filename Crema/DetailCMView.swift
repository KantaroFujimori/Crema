//
//  DetailCMView.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/28.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class DetailCMView: UIView {

    var jenreIcon = UIImageView()
    var userIcon = UIImageView()
    var contributionImageView = UIImageView()
    var contributionId = ""
    var spotNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        spotNameLabel.frame = CGRect(x: 10, y: 0, width: 140, height: 13)
        spotNameLabel.adjustsFontSizeToFitWidth = true
        spotNameLabel.textAlignment = NSTextAlignment.center
        spotNameLabel.font = UIFont(name:"ArialHebew", size:UIFont.labelFontSize)
        spotNameLabel.backgroundColor = UIColor.white
        
        contributionImageView.frame = CGRect(x: 35, y: 25, width: 80, height: 80)
        userIcon.frame = CGRect(x: 25, y: 15, width: 30, height: 30)
        jenreIcon.frame = CGRect(x: 60, y: 115, width: 30, height: 30)
        contributionImageView.layer.masksToBounds = true
        userIcon.layer.masksToBounds = true
        jenreIcon.layer.masksToBounds = true
        
        self.addSubview(spotNameLabel)
        self.addSubview(contributionImageView)
        self.addSubview(userIcon)
        self.addSubview(jenreIcon)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        spotNameLabel.frame = CGRect(x: 10, y: 0, width: 140, height: 13)
        spotNameLabel.adjustsFontSizeToFitWidth = true
        spotNameLabel.textAlignment = NSTextAlignment.center
        spotNameLabel.font = UIFont(name:"ArialHebew", size:UIFont.labelFontSize)
        spotNameLabel.backgroundColor = UIColor.white
        
        contributionImageView.frame = CGRect(x: 35, y: 25, width: 80, height: 80)
        userIcon.frame = CGRect(x: 25, y: 15, width: 30, height: 30)
        jenreIcon.frame = CGRect(x: 60, y: 115, width: 30, height: 30)
        contributionImageView.layer.masksToBounds = true
        userIcon.layer.masksToBounds = true
        jenreIcon.layer.masksToBounds = true
        
        self.addSubview(spotNameLabel)
        self.addSubview(contributionImageView)
        self.addSubview(userIcon)
        self.addSubview(jenreIcon)
    }
}
