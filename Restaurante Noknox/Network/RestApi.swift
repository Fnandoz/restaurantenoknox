//
//  RestApi.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 12/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

protocol RestApiProtocol {
    static func makeLogin(username: String, password: String, callback: @escaping(_ auth: Auth?) -> Void, error: @escaping() -> Void)
    
    static func getCuisine(lat: Double, lng: Double, auth: Auth, callback: @escaping(_ cuisines: [Cuisine]) -> Void, error: @escaping() -> Void)
    
    static func getRestaurant(lat: Double, lng: Double, cuisines: [Cuisine], callback: @escaping(_ restaurants: [Restaurant]) -> Void, error: @escaping() -> Void)
}
