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
        // Do any additional setup after loading the view, typically from a nib.
        clLocMan = CLLocationManager();
        clLocMan.delegate = self;
        clLocMan.desiredAccuracy = kCLLocationAccuracyKilometer;
        arrayCoord = []
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            str = "Se van a solicitar permisos";
            clLocMan.requestWhenInUseAuthorization();
            break;
        case .authorizedAlways:
            str = "Autorizado siempre";
            break;
        default:
            str = "Autorizado en uso";
            getLocation();
        }
        
        miLabel.text = str;
        
    }
    
    @IBAction func paraLectura(_ sender: Any) {
        miLabel2.text = "Se han parado las lecturas";
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
        miLabel2.text = "Longitud: \(clCoordinate.longitude) \n Latitud: \(clCoordinate.latitude)";
        
        let region = MKCoordinateRegion(center: clCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(region, animated: true);
        
        arrayCoord.append(clCoordinate)
        
        mapView.showsUserLocation = true
        
//        if(arrayCoord.count>=5){
//            clLocMan.stopUpdatingLocation();
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "locationList" {
            let destino = segue.destination as! LocationListControllerTableViewController
            destino.arrayCoord = self.arrayCoord
        }
    }
}

