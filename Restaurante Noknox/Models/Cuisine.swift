//
//  Cousine.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 11/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import ObjectMapper

class Cuisine: Mappable {
    var id: String?
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    
}
