//
//  MapViewController.swift
//  TestApplication
//
//  Created by Jonathan Ruedas Mora on 21/6/17.
//  Copyright © 2017 Jonathan Ruedas Mora. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    var coordenadas: CLLocationCoordinate2D!
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func printLocation(){
        let region = MKCoordinateRegion(center: self.coordenadas, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true);

        let miPos: MKPointAnnotation = MKPointAnnotation()
        miPos.coordinate = CLLocationCoordinate2DMake(coordenadas.latitude, coordenadas.longitude);
        miPos.title = "Posicion"
        
        mapView.addAnnotation(miPos)
    }
}
