//
//  battlebuck_demoTests.swift
//  battlebuck demoTests
//
//  Created by Pratik Choudhary on 27/09/24.
//

import XCTest
@testable import battlebuck_demo

final class battlebuck_demoTests: XCTestCase {
    var viewModel: ImagesViewModel!
    private var expectation: XCTestExpectation!
    override func setUpWithError() throws {
        expectation = expectation(description: "Expectation")
    }


    func testFetchProducts() {
        
        APIManager.shared.request(
            modelType: [ImagesModel].self,
            type: EndPoint.imagesData) { response in
                
                switch response {
                case .success(let data):
                    XCTAssertTrue(!data.isEmpty)
                 
                    self.expectation.fulfill()
                    
                case .failure(let error):
                    
                    XCTFail("API call failed with error: \(error)")
                }
            }
        wait(for: [expectation], timeout: 15.0)
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
