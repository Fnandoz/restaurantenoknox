
//
//  Api.swift
//  Restaurante NoknoxTests
//
//  Created by Fernando Gomes on 12/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest
@testable import Restaurante_Noknox

class ApiTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMakeLogin() {
        RestApi.makeLogin(username: "noknox", password: "noknox123A!", callback: {auth in
            XCTAssertNotNil(auth?.access_token)
            XCTAssertEqual(auth?.token_type, "token_type")            
        }, error: {})
    }

}
