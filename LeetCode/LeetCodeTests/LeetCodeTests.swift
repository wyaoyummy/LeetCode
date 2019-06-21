//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by fknm on 2019/6/21.
//  Copyright © 2019年 supernano. All rights reserved.
//

import XCTest
@testable import LeetCode

class LeetCodeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func filtersDou() {
        let arrays = ["1", "2", "2", "3", "4", "4"]
        let filterArrays = arrays.filterDoubleElements({$0})
        print(filterArrays)
    }
    
    func forwar() {
        let arr = ["leetCode", "leetC", "leet", "lee"]
        let ss = LeetCoder.longestCommonPrefix(arr)
        print(ss)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        forwar()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
