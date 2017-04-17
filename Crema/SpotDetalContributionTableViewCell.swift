//
//  SpotDetalContributionTableViewCell.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/16.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class SpotDetalContributionTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var contributionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
