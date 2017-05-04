//
//  ReactionTableViewCell.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/20.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class ReactionTableViewCell: UITableViewCell {

    @IBOutlet weak var reactionComment: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUI(){
        reactionComment.numberOfLines = 0
        reactionComment.sizeToFit()
        reactionComment.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
}
