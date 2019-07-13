//
//  RestaurantViewController.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 13/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    var restaurant: Restaurant? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = restaurant?.name
        self.ratingLabel.text = "⭑ \(restaurant?.rating ?? "")"
        if !(restaurant?.imageUrl!.isEmpty)! {
            restaurantImage.download(from: URL(string: restaurant!.imageUrl!)!)
        }
    }
    
    @IBAction func showAction(_ sender: Any) {
        let url = URL(string: restaurant!.url!)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }


}
