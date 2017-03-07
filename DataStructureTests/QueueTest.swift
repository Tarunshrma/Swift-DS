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
        queue = nil
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
    
    func testEnqeue()
    {
        //Given
        let expectedFrontItem = "A"
        do{
            try queue?.enqueue(item: expectedFrontItem)
            try queue?.enqueue(item: "B")
            try queue?.enqueue(item: "C")
            try queue?.enqueue(item: "D")
        }catch
        {
            XCTFail("Exception raised in insertion of queue")
        }
        
        var actualFrontItem:String = ""
        //When
        do{
            actualFrontItem  = try queue!.dequeue()
        }catch
        {
            XCTFail("Exception raised in dequeue")
        }
        //Then
        XCTAssert(expectedFrontItem == actualFrontItem, "item \(expectedFrontItem) should be front item but currently it is set to \(actualFrontItem)")
    }
    
    func testEnqeueWhenQueueIsFull()
    {
        //Given
        do{
            try queue?.enqueue(item: "A")
            try queue?.enqueue(item: "B")
            try queue?.enqueue(item: "C")
            try queue?.enqueue(item: "D")
            try queue?.enqueue(item: "E")
            try queue?.enqueue(item: "F") //This should not be allowed
        }catch QueueException.queueFull
        {
            XCTAssert(true, "Queue should be full!")
        }catch
        {
            XCTFail("Exception raised in enqueue")
        }
    }
    
    func testDeQeueWhenQueueIsEmpty()
    {
        //Given
        do{
           _ = try queue?.dequeue()
        }catch QueueException.queueEmpty
        {
            XCTAssert(true, "Queue should be empty!")
        }catch
        {
            XCTFail("Exception raised in enqueue")
        }
    }
    
    func testdeQueue()
    {
        //Given
        let expectedDequeueItem = "C"
        var actualDequeueItem = ""
        
        do{
            try queue?.enqueue(item: "A")
            try queue?.enqueue(item: "B")
            try queue?.enqueue(item: "C")
            try queue?.enqueue(item: "D")
            try queue?.enqueue(item: "E")
            
            _ = try queue?.dequeue()
            _ = try queue?.dequeue()
            actualDequeueItem = try (queue?.dequeue())!
            
        }catch
        {
            XCTFail("Exception raised in enqueue/dequeue of queue")
        }
        
       
        //Then
        XCTAssert(expectedDequeueItem == actualDequeueItem, "item \(expectedDequeueItem) should be front item but currently it is set to \(actualDequeueItem)")
    }


    
}
