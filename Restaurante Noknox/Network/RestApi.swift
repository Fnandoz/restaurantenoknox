//
//  RestApi.swift
//  Restaurante Noknox
//
//  Created by Fernando Gomes on 12/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

protocol RestApiProtocol {
    static func makeLogin(username: String, password: String, callback: @escaping(_ auth: Auth?) -> Void, error: @escaping() -> Void)
    
    static func getCuisine(lat: Double, lng: Double, auth: Auth, callback: @escaping(_ cuisines: [Cuisine]) -> Void, error: @escaping() -> Void)
    
    static func getRestaurant(lat: Double, lng: Double, cuisines: [Cuisine], callback: @escaping(_ restaurants: [Restaurant]) -> Void, error: @escaping() -> Void)
}

class RestApi: RestApiProtocol {
    static func makeLogin(username: String, password: String, callback: @escaping (Auth?) -> Void, error: @escaping () -> Void) {
        let url = Constants.BaseUrl + "/token"
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type": "application/json"]).validate().responseString { (response: DataResponse<String>) in
            let auth = Mapper<Auth>().map(JSONString: response.value!)
            callback(auth)
        }
    }
    
    static func getCuisine(lat: Double, lng: Double, auth: Auth, callback: @escaping ([Cuisine]) -> Void, error: @escaping () -> Void) {
        
    }
    
    static func getRestaurant(lat: Double, lng: Double, cuisines: [Cuisine], callback: @escaping ([Restaurant]) -> Void, error: @escaping () -> Void) {
        
    }
    
    
}
