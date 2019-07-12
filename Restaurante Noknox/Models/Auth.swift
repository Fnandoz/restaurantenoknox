//
//  AuthModel.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 11/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import ObjectMapper

class Auth: Mappable {
    var access_token: String?
    var token_type: String?
    var expires_in: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        access_token <- map["access_token"]
        token_type <- map["token_type"]
        expires_in <- map["expires_in"]
    }
}
