//
//  TreeTest.swift
//  DataStructure
//
//  Created by Tarun Sharma on 9/9/16.
//  Copyright © 2016 Tarun Sharma. All rights reserved.
//

import XCTest


class TreeTest: XCTestCase {
    
    var tree:Tree?
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        self.tree = Tree()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.tree = nil
    }
    
    //Test the tree initialization without parametrized constructor
    func testTreeInitializationWithoutConstructor(){
        XCTAssertNil(self.tree,"Tree no initialized...")
        XCTAssertNotNil(self.tree?.root,"Tree should be empty i.e. root should be nil on default initlization without parameter")
    }
    
    //Test the tree initialization without parametrized constructor
    func testTreeInitializationWithConstructor(){
        //GIVEN
        let rootNodeData = 15 //Initial root node data
        let objTree:Tree = Tree(rootNode: rootNodeData) //initialized tree with root node
        //WHEN
        
        //THEN
        XCTAssertNil(objTree,"Tree no initialized...")
        XCTAssertNil(objTree.root,"Tree root should not be nil")
        XCTAssert((objTree.root?.data == rootNodeData),"expected value for root node should be \(rootNodeData)")
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
