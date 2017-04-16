//
//  autoLayout.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/04.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class autoLayout: NSObject {

    //autoLayout
    func addSubview(_ childView: UIView, parentView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(childView)
        parentView.addConstraints([
            NSLayoutConstraint(
                item: childView,
                attribute: NSLayoutAttribute.top,
                relatedBy: NSLayoutRelation.equal,
                toItem: parentView,
                attribute: NSLayoutAttribute.top,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: childView,
                attribute: NSLayoutAttribute.left,
                relatedBy: NSLayoutRelation.equal,
                toItem: parentView,
                attribute: NSLayoutAttribute.left,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: childView,
                attribute: NSLayoutAttribute.right,
                relatedBy: NSLayoutRelation.equal,
                toItem: parentView,
                attribute: NSLayoutAttribute.right,
                multiplier: 1.0,
                constant: 0
            ),
            NSLayoutConstraint(
                item: childView,
                attribute: NSLayoutAttribute.bottom,
                relatedBy: NSLayoutRelation.equal,
                toItem: parentView,
                attribute: NSLayoutAttribute.bottom,
                multiplier: 1.0,
                constant: 0
            ),
            ])
        
    }
}
