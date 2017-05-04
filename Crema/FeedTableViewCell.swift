//
//  FeedTableViewCell
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/16.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var contributionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        captionLabel.numberOfLines = 0
        captionLabel.sizeToFit()
        captionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
}
