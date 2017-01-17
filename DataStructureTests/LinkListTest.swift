//
//  LinkListTest.swift
//  DataStructure
//
//  Created by Tarun Sharma on 1/17/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import XCTest

@testable import DataStructure

class LinkListTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateListWithItem() {
        //Given
        let list = LinkList<String>(item: "Tarun")
        
        //When
        let listCount = list.count()
        
        //Then
       XCTAssertEqual(listCount, 1,"The list should be initialized with 1 item")
    }
    
    func testCreateListWithoutItem() {
        //Given
        let list = LinkList<String>()
        
        //When
        let listCount = list.count()
        
        //Then
        XCTAssertEqual(listCount, 0,"The list should be initialized with 0 items")
    }
    
    func testCreateListWithItems() {
        //Given
        let list = LinkList<String>(items: ["Tarun","Sanchit","Eiti"])
        
        //When
        let listCount = list.count()
        
        //Then
        XCTAssertEqual(listCount, 3,"The list should be initialized with 3 items")
    }
    
    func testAppendItem()
    {
        //Given
        let list = LinkList<String>(items: ["Tarun","Sanchit","Eiti"])
        
        //When
        list.append(item: "Papa")
        let listCount = list.count()
        
        //Then
        XCTAssertEqual(listCount, 4,"The list should be 4 items now")
    }
    
    func testIsItemExistWithValidSearchValue()
    {
        //Given
        let stringTobeSearch = "Sanchit"
        let list = LinkList<String>(items: ["Tarun","Sanchit","Eiti"])
        var isExist = false
        
        //When
        do{
            isExist = try list.itemExist(item: stringTobeSearch)
        }catch{
           XCTFail("Exception raised")
        }
        
        
        //Then
        XCTAssertTrue(isExist,"Item \(stringTobeSearch) should be present in list")
    }
    
    func testIsItemExistWithInValidSearchValue()
    {
        //Given
        let stringTobeSearch = "Papa"
        let list = LinkList<String>(items: ["Tarun","Sanchit","Eiti"])
        var isExist = false
        
        //When
        do{
            isExist = try list.itemExist(item: stringTobeSearch)
        }catch{
            XCTFail("Exception raised")
        }
        
        
        //Then
        XCTAssertFalse(isExist,"Item \(stringTobeSearch) should not be present in list")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
