//
//  CuisineViewController.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 12/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CuisineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var cuisineTableView: UITableView!
    var cuisines: [Cuisine] = []
    var selectedCuisines: [String] = []
    var lat = Double()
    var lng = Double()
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

        navigationItem.hidesBackButton = true
        self.locManager.delegate = self
        self.locManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locManager.requestAlwaysAuthorization()
        self.locManager.startUpdatingLocation()
        
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
//        let restaurantsVC = self.storyboard?.instantiateViewController(withIdentifier: "restaurantsVC") as! RestaurantsViewController
//        restaurantsVC.selectedCuisines = self.selectedCuisines
//        restaurantsVC.lat = self.lat
//        restaurantsVC.lng = self.lng
//        self.present(restaurantsVC, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "restaurantsSegue" {
            let destinationVC = segue.destination as! RestaurantsViewController
            destinationVC.selectedCuisines = self.selectedCuisines
            destinationVC.lat = self.lat
            destinationVC.lng = self.lng

        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.lat = locValue.latitude
        self.lng = locValue.longitude
    }
}
