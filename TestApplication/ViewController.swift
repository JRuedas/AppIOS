//
//  ViewController.swift
//  TestApplication
//
//  Created by Jonathan Ruedas Mora on 19/6/17.
//  Copyright © 2017 Jonathan Ruedas Mora. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var miBoton: UIButton!
    
    @IBOutlet weak var miLabel: UILabel!

    @IBOutlet weak var miLabel2: UILabel!
    
    @IBOutlet weak var miBoton2: UIButton!
    
    var arrayCoord: [CLLocationCoordinate2D]!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var clLocMan: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clLocMan = CLLocationManager();
        clLocMan.delegate = self;
        clLocMan.desiredAccuracy = kCLLocationAccuracyKilometer;
        arrayCoord = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func acciondelboton(_ sender: Any) {
        let clAuthStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus();
        var str: String;
        
        switch clAuthStatus {
        case .restricted:
            str = "Restringido";
            break;
        case .denied:
            str = "Denegado";
            break;
        case .notDetermined:
            str = "Solicitando permisos";
            clLocMan.requestWhenInUseAuthorization();
            break;
        case .authorizedAlways:
            str = "Autorizado siempre";
            break;
        default:
            str = "Autorizado en uso";
            getLocation();
        }
        
        miLabel2.text = str;
    }
    
    @IBAction func paraLectura(_ sender: Any) {
        miLabel2.text = "Lecturas detenidas";
        clLocMan.stopUpdatingLocation();
    }
    
    func getLocation(){
        if(!CLLocationManager.locationServicesEnabled()){
            miLabel2.text = "Localizacion desactivada";
            return;
        }
        
        clLocMan.startUpdatingLocation();
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let clCoordinate: CLLocationCoordinate2D = locations[0].coordinate;
        miLabel.text = "Longitud: \(clCoordinate.longitude)\nLatitud: \(clCoordinate.latitude)"
        
        let region = MKCoordinateRegion(center: clCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(region, animated: true);
        
        arrayCoord.append(clCoordinate)
        
        mapView.showsUserLocation = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "locationList" {
            let destino = segue.destination as! LocationListControllerTableViewController
            destino.arrayCoord = self.arrayCoord
        }
    }
}

