//
//  CustomNavigationView.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/24.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

@objc protocol CustomDelegate {
    func tappedBackBtn()
}

@IBDesignable
class CustomNavigationView: UIView {

    @IBOutlet weak var backBtn: UIButton!
    weak var customDelegate: CustomDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        comminInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        comminInit()
    }
    private func comminInit() {
        // MyCustomView.xib からカスタムViewをロードする
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomNavigationView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        // カスタムViewのサイズを自分自身と同じサイズにする
        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                                      metrics:nil,
                                                                      views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                      options:NSLayoutFormatOptions(rawValue: 0),
                                                                      metrics:nil,
                                                                      views: bindings))
    }
    
    @IBAction func tapBackBtn(_ sender: Any) {
        self.customDelegate?.tappedBackBtn()
    }

}
