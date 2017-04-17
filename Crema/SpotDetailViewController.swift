//
//  SpotDetailViewController.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/13.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import SDWebImage

class SpotDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var spotDetailTableView: UITableView!
    var contribution = Contribution()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spotDetailTableView.register(UINib(nibName: "SpotDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "SpotDetailTableViewCell")
        self.spotDetailTableView.register(UINib(nibName: "SpotDetalContributionTableViewCell", bundle: nil), forCellReuseIdentifier: "SpotDetalContributionTableViewCell")
        
        self.spotDetailTableView.delegate = self
        self.spotDetailTableView.dataSource = self
        
        print(contribution.name)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        ModelLocater.sharedInstance.getUser().user.addObserver(self, forKeyPath: "id", options: .new, context: nil)
//        ModelLocater.sharedInstance.getUser().fetchUserData(id: userId)
        
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(true)
//        ModelLocater.sharedInstance.getUser().user.removeObserver(self, forKeyPath: "id")
//        ModelLocater.sharedInstance.getContribution().removeObserver(self, forKeyPath: "contributions")
//    }
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if(keyPath == "id"){
//            
//        }else if(keyPath == "contributions"){
//            self.contributions = change![.newKey] as! [Contribution]
//            for con in self.contributions{
//                self.createPin(contribution: con)
//                //                let uploadSpot = Upload(contribution: con)
//                //                uploadSpot.save()
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetailTableViewCell", for: indexPath) as! SpotDetailTableViewCell
            
            cell.spotNameLabel.text = self.contribution.name
            let imageURL = URL(string: self.contribution.photo_url)
            cell.spotTopImage.sd_setImage(with: imageURL)
            
            //MARK: set temporary info
            cell.jenreImage.image = UIImage(named: "cafe.png")
            cell.priceLabel.text = "〜999"
            cell.likeNumberLabel.text = "34"
            cell.favoriteNumberLabel.text = "20"
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpotDetalContributionTableViewCell", for: indexPath) as! SpotDetalContributionTableViewCell
            
            cell.profileNameLabel.text = self.contribution.user_id
            let imageURL = URL(string: self.contribution.photo_url)
            cell.contributionImage.sd_setImage(with: imageURL)
            cell.captionLabel.text = self.contribution.caption
            
            //MARK: set temporary info
            cell.profileImage.layer.borderColor = UIColor.gray.cgColor
            cell.profileImage.layer.borderWidth = 1
            cell.profileImage.layer.cornerRadius = 20
            cell.profileImage.layer.masksToBounds = true
            cell.profileImage.image = UIImage(named: "my_profile.jpg")

            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 240
        }else{
            return 410
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
