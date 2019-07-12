//
//  Cousine.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 11/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import ObjectMapper

class Cusine: Mappable {
    var id: Int?
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    
}
