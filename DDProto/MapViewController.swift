//
//  MapViewController.swift
//  DDProto
//
//  Created by joe on 26/01/2016.
//  Copyright © 2016 Joe O'Leary. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{
    
    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var myAddressView: UILabel!
  
    @IBOutlet weak var myAddressView1: UILabel!
    @IBOutlet weak var myAddressView2: UILabel!
    @IBOutlet weak var myLocationView: UILabel!
    
    
    @IBAction func imSomewhereElse(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }

    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Location Delegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil)
            {
                print("Error: " + error!.localizedDescription)
                return
            }
            
            if placemarks!.count > 0
            {
                let pm = placemarks![0] 
                self.displayLocationInfo(pm)
            }
            else
            {
               print("Error with the data.")
            }
        })
        
        
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
        //GPS Coordinates
        
        

  
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        // Your current location is:
        myLocationView.text = "\(locValue.latitude)" + "\n" + " \(locValue.longitude)"
    }
    
    
    func displayLocationInfo(placemark: CLPlacemark)
    {
        
        self.locationManager.stopUpdatingLocation()
        print(placemark.name)
     /*   print(placemark.addressDictionary) */
        print(placemark.locality)
     /*   print(placemark.postalCode) */
        print(placemark.administrativeArea)
        print(placemark.country)
        print(placemark.addressDictionary)
        
        // Your current address is:

        // myAddressView.text = /*"\(placemark.name!)"
        myAddressView.text = "\(placemark.locality!)"
        myAddressView1.text = "\(placemark.administrativeArea!)"
        myAddressView2.text = "\(placemark.country!)"
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error: " + error.localizedDescription)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let secondVC: PlaceAdTableViewController = segue.destinationViewController as! PlaceAdTableViewController
        
        secondVC.receivedString = myAddressView.text!
        secondVC.receivedString1 = myAddressView1.text!
        secondVC.receivedString2 = myAddressView2.text!
    }
    
}