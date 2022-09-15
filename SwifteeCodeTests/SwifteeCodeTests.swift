//
//  SwifteeCodeTests.swift
//  SwifteeCodeTests
//
//  Created by Daniel Hu on 2022-09-15.
//

import XCTest
@testable import SwifteeCode

class SwifteeCodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_LeetCode_11() throws {
        let sut = ContainerWithMostWater()
        let inputs = [
            [1,8,6,2,5,4,8,3,7],
            [1, 1]
        ]
        let expectedOutputs = [
            49, 1
        ]
        
        let outputs = inputs.map{ sut.maxArea($0) }
        
        XCTAssertEqual(expectedOutputs, outputs)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
