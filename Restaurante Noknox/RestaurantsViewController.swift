//
//  RestaurantsViewController.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 13/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectedCuisines: [String] = []
    var restaurants: [Restaurant] = []
    var lat: Double = 0.0
    var lng: Double = 0.0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RestApi.getRestaurant(lat: self.lat, lng: self.lng, cuisines: selectedCuisines.joined(separator: ","), authToken: UserDefaults.standard.string(forKey: Constants.Token)!, callback: { response in
            self.restaurants = response
            self.tableView.reloadData()
            
        }, error: {})
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)
        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = "⭑ \(restaurant.rating ?? "-")"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "restaurantSegue" {
            var indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            let destinationVC = segue.destination as! RestaurantViewController
            destinationVC.restaurant = restaurants[indexPath!.row]
            
        }
        
    }

}
