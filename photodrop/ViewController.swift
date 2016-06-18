//
//  ViewController.swift
//  photodrop
//
//  Created by Gordon Seto on 2016-06-18.
//  Copyright © 2016 gordonseto. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
        self.mapView.userLocation.addObserver(self, forKeyPath: "location", options: NSKeyValueObservingOptions(), context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if self.mapView.showsUserLocation && self.mapView.userLocation.location != nil {
            
            let span = MKCoordinateSpanMake(0.0125, 0.0125)
            let region = MKCoordinateRegion(center: self.mapView.userLocation.location!.coordinate, span: span)
            self.mapView.setRegion(region, animated: true)
        }
    }

}

