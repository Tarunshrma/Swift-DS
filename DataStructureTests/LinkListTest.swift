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
    
    var defaultList:LinkList<String>?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //The list will be created in reverse order Eiti->Sanchit->Tarun
        defaultList = LinkList<String>(items: ["A"])
        
        do{
            try defaultList?.insert(item:"B")
            try defaultList?.insert(item:"C")
            try defaultList?.insert(item:"D")
            try defaultList?.insert(item:"E")
        }catch
        {
            print("Error in list creation \(error)")
        }
        
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
    
    func testInsertItemAtLast()
    {
        //GIVEN defaultList with initilized with 3 items.
        let expectedCountAfterInsertion = (defaultList?.count())! + 1
        
        //WHEN
        do{
            try defaultList?.insert(item: "Papa")
        }catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        
        //THEN
        let count = defaultList?.count()
        XCTAssert(count == expectedCountAfterInsertion, "After insertion total count should be \(expectedCountAfterInsertion)")
    }
    
    func testInsertItemAtLastIndex()
    {
        //GIVEN defaultList with initilized with 3 items.
        let expectedCountAfterInsertion = (defaultList?.count())! + 1
        let itemToBeInserted = "Papa"
        
        //WHEN
        do{
            //Try to insert an item at index 3 i.e. as last item
            try defaultList?.insert(item: itemToBeInserted)
        }catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        
        //THEN
        let count = defaultList?.count()
        XCTAssert(count == expectedCountAfterInsertion, "After insertion total count should be \(expectedCountAfterInsertion)")
        
        do{
            //Try to insert an item at index 3 i.e. as last item
            let lastItemInList = try defaultList?.lastItem()
            
            XCTAssert(itemToBeInserted == lastItemInList, "last item in the list should be \(itemToBeInserted) but it is \(lastItemInList)")
        }catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        

    }
    
    func testInsertItemAtOutOfBoundIndex()
    {
        //GIVEN defaultList with initilized with 3 items.
        let index = 6
        let itemToBeInserted = "Papa"
        
        //WHEN
        do{
            //Try to insert an item at index 3 i.e. as last item
            try defaultList?.insert(item: itemToBeInserted, atIndex: index)
            XCTFail("Exception should have been raised")
        }catch
        {
            //if excetion occured
        }
    }
    
    
    func testInsertItemAtSpecificIndex()
    {
        //GIVEN defaultList with initilized with 3 items.
        let index  = 2
        let itemToBeInserted = "Papa"
        let expectedCountAfterInsertion = (defaultList?.count())! + 1
        
        
        //WHEN
        do{
            //Try to insert an item at specific index
            try defaultList?.insert(item: itemToBeInserted, atIndex: index)
        }catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        
        //THEN
        let count = defaultList?.count()
        XCTAssert(count == expectedCountAfterInsertion, "After insertion total count should be \(expectedCountAfterInsertion)")
        
    }
    
    func testRemoveFirstItem()
    {
        //GIVEN
        let index = 0 //remove item at first indes
        let expectedCountAfterDeleation = (defaultList?.count())! - 1
        
        //WHEN
        do{
            try defaultList?.removeItem(atIndex: index)
        }
        catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        //THEN
        let count = defaultList?.count()
        XCTAssert(count == expectedCountAfterDeleation, "After deletion total count should be \(expectedCountAfterDeleation)")
    }

    func testRemoveItemWithIndex()
    {
        //GIVEN
        let index = 3 //remove item at first indes
        let expectedCountAfterDeleation = (defaultList?.count())! - 1
        
        //WHEN
        do{
            try defaultList?.removeItem(atIndex: index)
        }
        catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        //THEN
        let count = defaultList?.count()
        XCTAssert(count == expectedCountAfterDeleation, "After deletion total count should be \(expectedCountAfterDeleation)")
    }
    
    func testGetItemAtIndex()
    {
        //GIVEN
        let index = 3
        let expectedItem = "D"
        var item:String?
        
        //WHEN
        do{
            item = try defaultList?.item(atIndex: index)
        }
        catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        //THEN
        XCTAssert(item == expectedItem, "item at index \(index) should be \(item)")
    }
    
    func testReverseList()
    {
        do{
            try defaultList?.reverseList()
        }
        catch
        {
            XCTFail("Exception raised \(error.localizedDescription)")
            //if excetion occured
        }
        
    }
    
    func testReverseListUsingRecusrion()
    {
        defaultList?.reverseListUsingRecursion()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
