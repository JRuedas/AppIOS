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

    @IBOutlet weak var mapView: MKMapView!
    
    var coordenadas: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        printLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
