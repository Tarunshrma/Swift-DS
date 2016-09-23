//
//  TreeTest.swift
//  DataStructure
//
//  Created by Tarun Sharma on 9/9/16.
//  Copyright © 2016 Tarun Sharma. All rights reserved.
//

import XCTest
@testable import DataStructure

//helper methods for test suites
extension TreeTest{
    func createBinaryTreeWithElements(elements:[Int]){
        for element in elements{
            self.tree?.insertData(element)
        }
    }
}

class TreeTest: XCTestCase {
    
    var tree:Tree?
    
    override func setUp() {
        super.setUp()
        self.tree = Tree()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.tree = nil
    }
    
    //Test the tree initialization without parametrized constructor
    func testTreeInitializationWithoutConstructor(){
        XCTAssertNotNil(self.tree,"Tree not initialized...")
        XCTAssertNil(self.tree?.root,"Tree should be empty i.e. root should be nil on default initlization without parameter")
    }
    
    //Test the tree initialization without parametrized constructor
    func testTreeInitializationWithConstructor(){
        //GIVEN
        let rootNodeData = 15 //Initial root node data
        let objTree:Tree = Tree(withRootNode: rootNodeData) //initialized tree with root node
        //WHEN
        
        //THEN
        XCTAssertNotNil(objTree,"Tree no initialized...")
        XCTAssertNotNil(objTree.root,"Tree root should not be nil")
        XCTAssert((objTree.root?.data == rootNodeData),"expected value for root node should be \(rootNodeData)")
    }
    
    //Test the tree initialization with array of elemtns
    func testTreeInitializationWithArrayOfElements(){
        //GIVEN
        let objTree = Tree(withElements: [15,10,12,8,20,17,25])
        
        //WHEN
        XCTAssertNotNil(objTree,"Tree no initialized...")
        let heightOfTree:Int = objTree.height()
        
        //THEN
        XCTAssert((heightOfTree == 2),"Expected tree height should be 2, currently is is \(heightOfTree)")
    }
    
    func testHeightOfTree(){
        //GIVEN
        self.createBinaryTreeWithElements([15,10,12,8,20,17,25])
        //WHEN
        XCTAssertNotNil(self.tree,"Tree no initialized...")
        let heightOfTree:Int = self.tree!.height()
        
        //THEN
        XCTAssert((heightOfTree == 2),"Expected tree height should be 2, currently it is \(heightOfTree)")
    }
    
    func testHeightOfTreeAfterNewInsertion(){
        //GIVEN
        let objTree = Tree(withElements: [15,10,12,8,20,17,25]) //tree with the height of 2
        let newElement = 14
        //WHEN
        objTree.insertData(newElement) // on insertion of new element height should be updated to 3
        let heightOfTree:Int = objTree.height()
        
        //THEN
         XCTAssert((heightOfTree == 3),"Updated tree height should be 3, currently it is \(heightOfTree)")
    }
    
    func testInOrderTraversal(){
        let objTree = Tree(withElements: [15,10,12,8,20,17,25]) //tree with the height of 2
        objTree.InOrderTraversal(objTree.root)
    }

    func testPreOrderTraversal(){
        let objTree = Tree(withElements: [15,10,12,8,20,17,25]) //tree with the height of 2
        objTree.PreOrderTraversal(objTree.root)
    }
    
    func testPostOrderTraversal(){
        let objTree = Tree(withElements: [15,10,12,8,20,17,25]) //tree with the height of 2
        objTree.PostOrderTraversal(objTree.root)
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testIsBinarySearchTree(){
        //GIVEN : A tree object with some elements
        let objTree = Tree(withElements: [15,10,12,8,6,9,11,13,20,17,25,16,18,21,26])
        
        //WHEN
        let isBST = objTree.isBinarySearchTree(objTree.root)
        
        //THEN: expectation is passed tree should be binary search tree(as we are creating BST)
        XCTAssert(isBST, "Expected tree is binary search tree");
    }
    
    func testDeletionFromBinarySearchTree(){
        //GIVEN : A tree object with some elements
        let objTree = Tree(withElements: [15,10,12,8,6,9,11,13,20,17,25,16,18,21,26])
        
        //WHEN
        let isRemoved:Bool = objTree.remove(10)
        
        //THEN: expectation is passed tree should be binary search tree(as we are creating BST)
        XCTAssert(isRemoved, "Item is not removed from BST")
        let isStillABST = objTree.isBinarySearchTree(objTree.root)
        XCTAssert(isStillABST, "Expected tree should be binary search tree")
    }
    
    func testFindMinimumElementFromBST(){
        //GIVEN : A tree object with some elements
        let objTree = Tree(withElements: [15,10,12,8,6,9,11,13,20,17,25,16,18,21,26])
        
        //WHEN
        let min:Node = objTree.findMin(objTree.root)
        
        //THEN: expectation is minmimum element should be 6
        XCTAssert(min.data == 6, "function returning minimum value as \(min), Expecetd value should be 6 ")
    }
    
    func testFindMaximumElementFromBST(){
        //GIVEN : A tree object with some elements
        let objTree = Tree(withElements: [15,10,12,8,6,9,11,13,20,17,25,16,18,21,26])
        
        //WHEN
        let max:Int = objTree.findMax()
        
        //THEN: expectation is minmimum element should be 6
        XCTAssert(max == 26, "function returning minimum value as \(max), Expecetd value should be 26 ")
    }

}
