//
//  SpotDetailTableViewCell.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/16.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class SpotDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var spotTopImage: UIImageView!
    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var jenreImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var favoriteNumberLabel: UILabel!
    @IBOutlet weak var bookBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBookBtn()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setBookBtn(){
        bookBtn.setTitle("予約する", for: .normal)
        bookBtn.setTitleColor(UIColor.white, for: .normal)
        bookBtn.layer.masksToBounds = true
        bookBtn.layer.borderWidth = 2
        bookBtn.layer.borderColor = UIColor(red: 69/255.0, green: 151/255.0, blue: 245/255.0, alpha: 1.0).cgColor
        bookBtn.layer.cornerRadius = 10
        bookBtn.backgroundColor = UIColor(red: 69/255.0, green: 151/255.0, blue: 245/255.0, alpha: 1.0)
    }
    
}
