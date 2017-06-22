//
//  LocationListControllerTableViewController.swift
//  TestApplication
//
//  Created by Jonathan Ruedas Mora on 20/6/17.
//  Copyright © 2017 Jonathan Ruedas Mora. All rights reserved.
//

import UIKit
import CoreLocation

class LocationListControllerTableViewController: UITableViewController {

    var miTabla: UITableView!
    
    var arrayCoord: [CLLocationCoordinate2D]!
    
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCoord.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath) as UITableViewCell

        let long = self.arrayCoord[indexPath.row].longitude
        let lat = self.arrayCoord[indexPath.row].latitude

        cell.textLabel?.text = "Long: \(long) Lat: \(lat)"
        
        return cell
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayCoord.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = indexPath.row
        performSegue(withIdentifier: "mapLoc", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapLoc" {
            let destino = segue.destination as! MapViewController
            destino.coordenadas = self.arrayCoord[selected]
        }
    }
}
