//
//  FeedDetailViewController.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/20.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import ObjectMapper

class FeedDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomDelegate {
    
    
    @IBOutlet weak var customNavigationView: CustomNavigationView!
    @IBOutlet weak var feedTableView: UITableView!
    var contribution: Contribution?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        self.feedTableView.register(UINib(nibName: "ReactionTableViewCell", bundle: nil), forCellReuseIdentifier: "ReactionTableViewCell")
        
        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
        self.customNavigationView.customDelegate = self
        
        self.feedTableView.estimatedRowHeight = 300
        self.feedTableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedBackBtn(){
        //self.dismiss(animated: true, completion: nil)
       self.navigationController?.popToRootViewController(animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //spot情報
        if (indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
            
            cell.profileNameLabel.text = self.contribution?.userName
            let imageURL = URL(string: (self.contribution?.standardImage)!)
            cell.contributionImage.sd_setImage(with: imageURL)
            cell.captionLabel.text = self.contribution?.caption
            cell.captionLabel.numberOfLines = 0
            cell.captionLabel.sizeToFit()
            cell.captionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            //MARK: set temporary info
            cell.profileImage.layer.borderColor = UIColor.gray.cgColor
            cell.profileImage.layer.borderWidth = 1
            cell.profileImage.layer.cornerRadius = 20
            cell.profileImage.layer.masksToBounds = true
            let profileImageUrl = URL(string: (self.contribution?.userProfileUrl)!)
            cell.profileImage.sd_setImage(with: profileImageUrl)
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReactionTableViewCell", for: indexPath) as! ReactionTableViewCell
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}
