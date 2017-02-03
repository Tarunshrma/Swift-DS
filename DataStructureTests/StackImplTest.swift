//
//  StackImplTest.swift
//  DataStructure
//
//  Created by Tarun Sharma on 2/3/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import XCTest

class StackImplTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBalancedParanthesisWithValidExpression() {
        //GIVEN
        let givenExpression = "(a+[c+d]-{g-a(x+y)})"
        
        //WHEN
        let balanched = StackImplementations.checkBalancedParanthesis(forExpression: givenExpression)
        
        //THEN
        XCTAssert(balanched, "\(givenExpression) should be a valid expression")
    }
    
    func testBalancedParanthesisWithInValidExpression() {
        //GIVEN
        let givenExpression = "(a+[c+d-{g-a(x+y)})"
        
        //WHEN
        let balanched = StackImplementations.checkBalancedParanthesis(forExpression: givenExpression)
        
        //THEN
        XCTAssertFalse(balanched, "\(givenExpression) should be a invalid expression")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
