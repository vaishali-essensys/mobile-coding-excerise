//
//  SATechnology_TestTests.swift
//  SATechnology_TestTests
//
//  Created by Vaishali Desale on 7/16/24.
//

import XCTest
@testable import SATechnology_Test

final class SATechnology_TestTests: XCTestCase {
    
    func testRegisterUser() {
        let expectation = self.expectation(description: "Register User")
        
        let user = ["email": "test@test.com", "password": "password"]
        NetworkManager.shared.register(user: user) { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure:
                XCTFail("Registration failed")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testLoginUser() {
        let expectation = self.expectation(description: "Login User")
        let user = ["email": "test@test.com", "password": "password"]
        NetworkManager.shared.login(user: user) { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure:
                XCTFail("Login failed")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchNewInspection() {
        let expectation = self.expectation(description: "Fetch New Inspection")
        
        NetworkManager.shared.startInspection { result in
            switch result {
            case .success(let inspection):
                XCTAssertNotNil(inspection)
            case .failure:
                XCTFail("Fetching new inspection failed")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSubmitInspection() {
        let expectation = self.expectation(description: "Submit Inspection")
        let inspection = Inspection(id: 1, inspectionType: InspectionType(id: 1, name: "Test", access: "write"), area: Area(id: 1, name: "Test Area"), survey: Survey(id: 1, categories: []))
        
        NetworkManager.shared.submitInspection(inspection: inspection) { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure:
                XCTFail("Submission failed")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
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
