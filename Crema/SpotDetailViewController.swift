//
//  SpotDetailViewController.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/13.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import SDWebImage
import Bond

class SpotDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomDelegate {
    
    @IBOutlet weak var spotDetailTableView: UITableView!
    
    @IBOutlet weak var customNavigationView: CustomNavigationView!
    
    var contribution: ContributionRealm?
    var navigationVC: UINavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spotDetailTableView.register(UINib(nibName: "SpotDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "SpotDetailTableViewCell")
        self.spotDetailTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        self.spotDetailTableView.delegate = self
        self.spotDetailTableView.dataSource = self
        self.customNavigationView.customDelegate = self
        
        self.spotDetailTableView.estimatedRowHeight = 400
        self.spotDetailTableView.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tappedBackBtn(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //spot情報
        if (indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetailTableViewCell", for: indexPath) as! SpotDetailTableViewCell
            
            cell.spotNameLabel.text = self.contribution?.spotInstaName
            let imageURL = URL(string: (self.contribution?.standardImage)!)
            cell.spotTopImage.sd_setImage(with: imageURL)
            
            //MARK: set temporary info
//            let jenreConverter = JenreConverter()
//            let jenre = jenreConverter.convert(types: (self.contribution?.types)!)
            cell.jenreImage.image = UIImage(named: "default")
            
            
            cell.priceLabel.text = "〜999"
            cell.likeNumberLabel.text = "34"
            cell.favoriteNumberLabel.text = "20"
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
            
            cell.profileNameLabel.text = self.contribution?.userName
            
            let imageURL = URL(string: (self.contribution?.standardImage)!)
            cell.contributionImage.sd_setImage(with: imageURL)
            
            cell.captionLabel.text = self.contribution?.caption
            cell.captionLabel.numberOfLines = 0
            cell.captionLabel.sizeToFit()
            cell.captionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            cell.profileImage.layer.borderColor = UIColor.gray.cgColor
            cell.profileImage.layer.borderWidth = 1
            cell.profileImage.layer.cornerRadius = 20
            cell.profileImage.layer.masksToBounds = true
            let profileImageUrl = URL(string: (self.contribution?.userProfileUrl)!)
            cell.profileImage.sd_setImage(with: profileImageUrl)

            cell.selectionStyle = UITableViewCellSelectionStyle.blue
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if(indexPath.section == 0){
            return nil
        }else{
            return indexPath
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feedDetailVC: FeedDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "FeedDetailViewController") as! FeedDetailViewController
        feedDetailVC.contribution = self.contribution
        self.navigationController?.pushViewController(feedDetailVC, animated: true)
        //present(navigationVC, animated: true, completion: nil)
        
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
    }
}
