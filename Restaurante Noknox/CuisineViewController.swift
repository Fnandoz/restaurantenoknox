//
//  CuisineViewController.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 12/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit
import MapKit

class CuisineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var cuisineTableView: UITableView!
    var cuisines: [Cuisine] = []
    var selectedCuisines: [String] = []
    var lat: Double = 0.0
    var lng: Double = 0.0
    var locManager = CLLocationManager()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuisines.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell!.isSelected {
            cell!.isSelected = false
            if cell!.accessoryType == UITableViewCell.AccessoryType.none {
                cell!.accessoryType = UITableViewCell.AccessoryType.checkmark
                let cuisine = cuisines[indexPath.row].id!
                selectedCuisines.append(cuisine)
            }
            else {
                cell!.accessoryType = UITableViewCell.AccessoryType.none
                let cuisine = cuisines[indexPath.row].id!
                selectedCuisines.removeAll {$0 == cuisine}
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cuisineCell", for: indexPath)
        let cuisine = cuisines[indexPath.row]
        cell.textLabel?.text = cuisine.name
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = locManager.location else {
                return
            }
            self.lat = currentLocation.coordinate.latitude
            self.lng = currentLocation.coordinate.longitude
        }
        
        // Do any additional setup after loading the view.
        RestApi.getCuisine(lat: lat, lng: lng, authToken: UserDefaults.standard.string(forKey: Constants.Token)!, callback: { cuisines in
            self.cuisines = cuisines
            self.cuisineTableView.reloadData()
        }, error: {})
        
        self.cuisineTableView.allowsMultipleSelection = true
        self.cuisineTableView.allowsSelectionDuringEditing = true
    }
    
    @IBAction func nextACtion(_ sender: Any) {
        
    }
}
