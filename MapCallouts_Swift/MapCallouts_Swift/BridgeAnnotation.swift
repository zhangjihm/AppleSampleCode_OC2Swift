//
//  BridgeAnnotation.swift
//  MapCallouts_Swift
//
//  Created by Bryan Zhang on 4/17/15.
//  Copyright (c) 2015 Bryan Zhang. All rights reserved.
//

import UIKit
import MapKit

class BridgeAnnotation: NSObject, MKAnnotation{
    var coordinate = CLLocationCoordinate2D(latitude: 37.810000, longitude: -122.477450)
    
    // title & subtitle must be exactly the same variable name: "title", "subtitle"
    // or annotationView will NOT show the incorrect one!
    var title = "Golden Gate Bridge"
    var subtitle = "Opened: May 27, 1937"
    func createAnnotationViewForMapView(mapView: MKMapView, annotation: MKAnnotation) -> MKAnnotationView!{
        
        var returnedAnnotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(NSStringFromClass(BridgeAnnotation))
        
        if (returnedAnnotationView == nil) {
            returnedAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: NSStringFromClass(BridgeAnnotation)) as MKPinAnnotationView
            (returnedAnnotationView as! MKPinAnnotationView).pinColor = MKPinAnnotationColor.Purple
            println("\((returnedAnnotationView as! MKPinAnnotationView).pinColor)")
            (returnedAnnotationView as! MKPinAnnotationView).animatesDrop = true
            (returnedAnnotationView as! MKPinAnnotationView).canShowCallout = true
            
        }
        return returnedAnnotationView
    }
    
    
    
    
}
