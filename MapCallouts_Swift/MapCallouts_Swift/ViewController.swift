//
//  ViewController.swift
//  MapCallouts_Swift
//
//  Created by Bryan Zhang on 4/17/15.
//  Copyright (c) 2015 Bryan Zhang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.goToDefaultLocation()
        var annotation = BridgeAnnotation()
        mapView.addAnnotation(annotation)
        
        //gotta set delegate to mapView!  or no custom annotationView showed!
        //system using default annotationView with the information of bridgeAnnotation's property(tilte & subtitle, default pinColor)
        // try to comment the delegation line!
        self.mapView.delegate = self
    }
    
    
    
    func goToDefaultLocation(){
        var defaultRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.786996, -122.440100), MKCoordinateSpanMake(0.112872, 0.109863))
        
        mapView.setRegion(defaultRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        var annotationView: MKAnnotationView?
        if (annotation.isKindOfClass(BridgeAnnotation)) {
            var bridgeAnnotation = annotation as! BridgeAnnotation
            annotationView = bridgeAnnotation.createAnnotationViewForMapView(self.mapView, annotation: annotation)
            var button = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as! UIButton
            button.addTarget(nil, action: nil, forControlEvents: UIControlEvents.TouchUpInside)
            (annotationView as! MKPinAnnotationView).leftCalloutAccessoryView = button
        }
     return annotationView
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

