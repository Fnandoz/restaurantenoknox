//
//  Restaurant.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 11/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import ObjectMapper

class Restaurant: Mappable {
    var id: Int?
    var name: String?
    var url: String?
    var imageUrl: String?
    var rating: String?
    var cuisines: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        url <- map["url"]
        imageUrl <- map["imageUrl"]
        rating <- map["rating"]
        cuisines <- map["cuisines"]
    }
}
