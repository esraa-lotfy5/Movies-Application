//
//  NetworkDelegateTests.swift
//  NetworkDelegateTests
//
//  Created by Esraa Lotfy  on 5/12/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import XCTest
@testable import NetworkMovies

class NetworkDelegateTests: XCTestCase {
    var networkDelegate = NetworkDelegate.delegate
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testfetchResult(){
        let expectationOject = expectation(description: "Waiting for the response")
        networkDelegate.fetchResult{(result) -> Void in
            guard let result = result else{
                XCTFail()
                expectationOject.fulfill()
                return
            }
            XCTAssertEqual(result.items.count, 10, "error in API items' count")
            expectationOject.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
}
