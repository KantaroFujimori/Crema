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

class ToMapViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate {
    
    var myMapView: GMSMapView!
    let myLocationManager = CLLocationManager()
    var myNowPoint: CLLocationCoordinate2D!
    var selectedMarker: GMSMarker!
    var contributions: [Contribution] = []
    var selectedContribution = Contribution()
    let userId = "kitakaze_kan13"
    let instaId = "1427241033.6387935.7eef93c50d6a44f785aa2800a7894763"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.myMapView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        ModelLocater.sharedInstance.getUser().user.addObserver(self, forKeyPath: "id", options: .new, context: nil)
        ModelLocater.sharedInstance.getUser().fetchUserData(id: userId)
        ModelLocater.sharedInstance.getContribution().addObserver(self, forKeyPath: "contributions", options: .new, context: nil)
        ModelLocater.sharedInstance.getContribution().fetchContributions(user_id: userId, insta_id: instaId)

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
         ModelLocater.sharedInstance.getUser().user.removeObserver(self, forKeyPath: "id")
         ModelLocater.sharedInstance.getContribution().removeObserver(self, forKeyPath: "contributions")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "id"){

        }else if(keyPath == "contributions"){
            self.contributions = change![.newKey] as! [Contribution]
            for con in self.contributions{
                self.createPin(contribution: con)
//                let uploadSpot = Upload(contribution: con)
//                uploadSpot.save()
            }
        }
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //現在地
    func startLocation(){
        myLocationManager.startUpdatingLocation()
    }
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
    
    func mapView(_ mapView:GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        self.selectedMarker = marker
        self.performSegue(withIdentifier: "toSpotDetailSegue", sender: self)
    }

    //地点情報を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let spotDetailViewController = segue.destination as! SpotDetailViewController
        for con in self.contributions {
            if(self.selectedMarker.snippet == con.id){
                spotDetailViewController.contribution = con
            }
        }
    }
    
    
    func setNavigationBar() {
        self.navigationController!.navigationBar.barTintColor = UIColor.white
    }
    func setUI(){
        
        self.setNavigationBar()
        
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
        
    }
    func createPin(contribution: Contribution){
        let position = CLLocationCoordinate2D(latitude: contribution.lat, longitude: contribution.lon)
        let marker = GMSMarker(position: position)
        marker.title = contribution.name
        marker.snippet = contribution.id
        marker.map = myMapView
    }
}

