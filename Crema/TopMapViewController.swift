//
//  TopMapViewController.swift
//  Crema
//
//  Created by 藤森侃太郎 on 2017/04/02.
//  Copyright © 2017年 藤森侃太郎. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import Bond
import SDWebImage

class TopMapViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate,UISearchBarDelegate {
    
    
    var myMapView: GMSMapView!
    let myLocationManager = CLLocationManager()
    var myNowPoint: CLLocationCoordinate2D!
    var selectedMarker: GMSMarker!
    
    let contributionVM = ModelLocater().getContributionVM()
    
    var topMapSearchController: UISearchController!
    var spotDetailViewController: SpotDetailViewController!
    
    //実際はローカルDBから取得する
    let instaId = "1427241033.6387935.7eef93c50d6a44f785aa2800a7894763"
    
    var navigationVC: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUI()
        setBond()
        self.myMapView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.contributionVM.fetchContributions(insta_id: instaId)
        

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //現在地
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocation = locations.last! as CLLocation
        myNowPoint = myLocation.coordinate
        myMapView.animate(toLocation: myNowPoint)
        myLocationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        var statusStr = "";
        switch (status) {
        case .notDetermined:
            statusStr = "NotDetermined"
            manager.requestWhenInUseAuthorization()
        case .restricted:
            statusStr = "Restricted"
        case .denied:
            statusStr = "Denied"
        case .authorizedAlways:
            statusStr = "AuthorizedAlways"
        case .authorizedWhenInUse:
            statusStr = "AuthorizedWhenInUse"
        }
        print(" CLAuthorizationStatus: \(statusStr)")
        myLocationManager.startUpdatingLocation()
    }
    
    func mapView(_ mapView:GMSMapView, didTap marker: GMSMarker) -> Bool{
        self.selectedMarker = marker
        //self.performSegue(withIdentifier: "toSpotDetailSegue", sender: self)
        for con in (self.contributionVM.contributionList.value?.items)! {
            if(self.selectedMarker.snippet == con.id){
                spotDetailViewController.contribution = con
            }
        }
        present(navigationVC!, animated: true, completion: nil)
        mapView.clear()
        return true
        
    }
    func mapView(_ mapView:GMSMapView, idleAt cameraPosition:GMSCameraPosition){
        mapView.clear()
        let currentZoom = mapView.camera.zoom
        if let contributionItems = self.contributionVM.contributionList.value?.items {
            if(currentZoom >= 15){
                for con in contributionItems {
                    self.createDetailPin(contribution: con)
                }
            }else{
                for con in contributionItems {
                    self.createPin(contribution: con)
                }
            }
        }
    }
    
    func setUI(){
        
        //地図
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.notDetermined {
            myLocationManager.requestAlwaysAuthorization()
        }
        let camera = GMSCameraPosition.camera(withLatitude: -33.8683,longitude: 151.2086, zoom: 17)
        myMapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        myMapView.isMyLocationEnabled = true
        myMapView.delegate = self
        self.view = myMapView
        
        myLocationManager.delegate = self
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        myLocationManager.requestAlwaysAuthorization()
        myLocationManager.distanceFilter = 300
        myLocationManager.startUpdatingLocation()
        
        //nextViewController
        spotDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "SpotDetailViewController") as! SpotDetailViewController
        
        //navigationViewController
        navigationVC = UINavigationController(rootViewController: spotDetailViewController)
        navigationVC?.isNavigationBarHidden = true
        
        //searchController
        topMapSearchController = UISearchController(searchResultsController: nil)
        topMapSearchController.hidesNavigationBarDuringPresentation = true
        topMapSearchController.dimsBackgroundDuringPresentation = true
        self.definesPresentationContext = true
        let searchBar = topMapSearchController.searchBar
        searchBar.searchBarStyle = .default
        searchBar.barStyle = .default
        let height = UIApplication.shared.statusBarFrame.height + (self.navigationVC?.navigationBar.frame.size.height)!
        searchBar.frame = CGRect(x: 0, y: height, width: self.view.frame.width, height: 17)
        searchBar.sizeToFit()
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
    }
    func setBond(){
        self.contributionVM.contributionList.ignoreNil().observeNext { value in
            let currentZoom = self.myMapView.camera.zoom
            if(currentZoom >= 15){
                for con in (value.items)! {
                    self.createDetailPin(contribution: con)
                }
            }else{
                for con in (value.items)! {
                    self.createPin(contribution: con)
                }
            }
        }
        
    }
    func createDetailPin(contribution: Contribution){
        let position = CLLocationCoordinate2D(latitude: contribution.instaLat, longitude: contribution.instaLon)
        let marker = GMSMarker(position: position)
        let markerView = DetailCMView()
        markerView.frame = CGRect(x: 0, y: 0, width: 150, height: 165)
        
        markerView.spotNameLabel.text = contribution.spotGoogleName
        
        let jenreConverter = JenreConverter()
        let jenre = jenreConverter.convert(types: contribution.types)
        markerView.jenreIcon.image = UIImage(named: jenre)
        
        let imageURL = URL(string: (contribution.thumbnail))
        markerView.contributionImageView.sd_setImage(with: imageURL)
        markerView.contributionImageView.layer.cornerRadius = 10
        markerView.contributionImageView.layer.borderWidth = 0.3
        
        let profileImageUrl = URL(string: (contribution.userProfileUrl))
        markerView.userIcon.sd_setImage(with: profileImageUrl)
        markerView.userIcon.layer.borderColor = UIColor.gray.cgColor
        markerView.userIcon.layer.borderWidth = 0.2
        markerView.userIcon.layer.cornerRadius = 12
        
        
        marker.iconView = markerView
        marker.title = contribution.spotInstaName
        marker.snippet = contribution.id
        marker.map = self.myMapView
    }
    func createPin(contribution: Contribution){
        let position = CLLocationCoordinate2D(latitude: contribution.instaLat, longitude: contribution.instaLon)
        let marker = GMSMarker(position: position)
        let markerView = PinCMView()
        markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        let profileImageUrl = URL(string: (contribution.userProfileUrl))
        markerView.userIcon.sd_setImage(with: profileImageUrl)
        markerView.userIcon.layer.borderColor = UIColor.gray.cgColor
        markerView.userIcon.layer.borderWidth = 0.2
        markerView.userIcon.layer.cornerRadius = 10
        
        let jenreConverter = JenreConverter()
        let jenre = jenreConverter.convert(types: contribution.types)
        markerView.jenreIcon.image = UIImage(named: jenre)
        
        marker.iconView = markerView
        marker.title = contribution.spotInstaName
        marker.snippet = contribution.id
        marker.map = self.myMapView
    }
    
}

