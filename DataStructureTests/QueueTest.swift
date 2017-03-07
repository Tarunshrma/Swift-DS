//
//  QueueTest.swift
//  DataStructure
//
//  Created by Tarun Sharma on 3/6/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import XCTest
import Foundation

@testable import DataStructure

class QueueTest: XCTestCase {
    var queue:Queue<String>?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        queue = Queue<String>(withSize: 5)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    //test case to check if method is empty
    func testEmptyQueue()
    {
        //Given
        //test when queue is empty, isEmpty should reurn true
        
        //When
        let empty  = queue!.isEmpty()
        
        //Then
        XCTAssert(empty, "Queue should be empty!")
    }
    
    //test case to check if method is empty
    func testNonEmptyQueue()
    {
        //Given
        do{
            try queue?.enqueue(item: "Tarun")
            try queue?.enqueue(item: "Sanchit")
        }catch
        {
            XCTFail("Exception raised in insertion of queue")
        }
        
        //When
        let empty  = queue!.isEmpty()
        
        //Then
        XCTAssertFalse(empty, "Queue should not be empty!")
    }
    
}
