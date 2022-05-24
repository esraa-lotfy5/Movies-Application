//
//  MockNetworkDelegateTests.swift
//  NetworkDelegateTests
//
//  Created by Esraa Lotfy  on 5/12/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import XCTest
@testable import NetworkMovies

class MockNetworkDelegateTests: XCTestCase {

    let mockObject = MockNetworkDelegate(shouldReturnError: false)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchResult(){
        mockObject.fetchResult { (items) in
            guard let items = items else{
                XCTFail()
                return
            }
            XCTAssertEqual(items.items.count, 10, "API failed")
        }
    }
}
