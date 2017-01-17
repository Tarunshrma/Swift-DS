//
//  StackTest.swift
//  DataStructure
//
//  Created by SANCHIT SHARMA on 24/05/16.
//  Copyright © 2016 Tarun Sharma. All rights reserved.
//

import XCTest


class StackTest: XCTestCase {

    var stack:Stack?;
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stack = Stack(capacity: 10)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        stack = nil;
    }
    
    func testPush(){
        //Given
        let str = "Test";
        
        //When
        do{
           try stack?.push(str)
        }catch StackException.stackOverFlow{
            XCTAssert(false, "Stack overflow error")
        }catch{
            XCTAssert(false, "Unknown Error")
        }
        
        //Then
        var strTopValue:String?
        do{
            try strTopValue = stack?.peek() as? String
        }catch StackException.stackEmpty{
            XCTAssert(false, "Stack Empty error")
        }catch{
            XCTAssert(false, "Unknown Error")
        }
        
        XCTAssert(strTopValue==str, "Top Value is not matching inserterd value")
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

}
