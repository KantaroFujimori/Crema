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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
