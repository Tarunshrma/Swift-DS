//
//  Node.swift
//  DataStructures
//
//  Created by Tarun Sharma on 9/1/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

import Foundation

let kDefaultGarbageValue:Int = -9999999999999;

class Node{
    var data:Int;
    var left: Node?;
    var right: Node?;
    
    init(){
        self.data = kDefaultGarbageValue;
    }
    
    init(withData rootData:Int){
        self.data = rootData;
    }
}

//Private helper methods
extension Tree{
    //Put the data and reset the current node to root for new insertion traversal
    private func putData(inNode node:Node!, data:Int){
        node.data = data;
        self.resetCurrentNodePointer()
    }
    
    //This method will reset the current pointer to root node for fresh traversal
    private func resetCurrentNodePointer(){
        self.currentNode = self.root;
    }
    
    private func getHeightForRootNode(node:Node?)->Int{
        
        guard let aNode = node else{
            return -1
        }
        
        let leftSubTreeHeight = getHeightForRootNode(aNode.left)
        let rightSubTreeHeight = getHeightForRootNode(aNode.right)
        
        return max(leftSubTreeHeight,rightSubTreeHeight) + 1
    }
    
    private func createBinaryTreeWithElements(elements:[Int]){
        for element in elements{
            self.insertData(element)
        }
    }
    
    // MARK: Utility methods for checking is binary search tree
    private func isBST(node:Node?,minimum min:Int,maximum max:Int)->Bool{
        guard let root  = node else{ //An empty tree is valid binary search tree
            return true
        }
        
        if isNodeInValidRange(root, minimum: min, maximum: max) &&
                isBST(root.left,minimum:min, maximum:root.data) &&
                isBST (root.right,minimum:(root.data+1), maximum:max){
            return true
        }
        else{
            return false
        }
    }
    
    private func isNodeInValidRange(node:Node,minimum min:Int,maximum max:Int)->Bool{
        var isNodeInValidRange:Bool = false
        if (node.data>=min && node.data<max){
            isNodeInValidRange = true
        }
        return isNodeInValidRange
    }
    
    
}

class Tree{
    
    var root:Node?;
    
    private var currentNode:Node?
    
    init(){
        self.root = nil;
        self.currentNode = root;
    }
    
    //Initialize the root node with data
    init(withRootNode rootNode:Int?){
        self.root = Node();
        if let data = rootNode{
            self.putData(inNode: self.root, data: data);
        }
        
        self.currentNode = root;
    }
    
    //Initilized tree with array of elements
    init(withElements elements:[Int]?){
        precondition((elements?.count > 0), "Please provide valid list of elements to be inserted into tree")
        self.createBinaryTreeWithElements(elements!)
    }
    
    func insertData(_data:Int) -> Node {
        var node:Node? = self.currentNode;
        
        if (self.isTreeEmpty()){
            node  = Node(withData:_data)
            self.root = node
            self.currentNode = self.root
        }else if(node == nil){
            //create a node and insert data
            node  = Node();
            self.putData(inNode: node!, data: _data);
        }else if(_data<=node!.data){ // if data entered is less then root data
            self.currentNode = node!.left;
            node!.left = insertData(_data);
        }else if(_data>node!.data){ // if data entered is greater then root data
            self.currentNode = node!.right;
            node!.right = insertData(_data);
        }
        
        return node!
    }
    
    //Check if tree is empty
    func isTreeEmpty() -> Bool {
        var treeEmpty = false;
        
        if (self.root == nil){
            treeEmpty = true;
        }else if(self.root?.data == kDefaultGarbageValue){
            treeEmpty = true;
        }
        
        
        return treeEmpty;
    }
    
    //Find the minimum element in tree
    func findMin()->Int{
        precondition(self.isTreeEmpty() == false, "Tree is empty! please insert some element fist")
        
        if (self.currentNode?.left == nil){ //Base condition to terminate the recursion
            let data:Int = (self.currentNode?.data)!;
            self.resetCurrentNodePointer()
            return data;
        }
        self.currentNode = self.currentNode?.left
        return findMin();
    }
    
    //Find the maximum element in tree
    func findMax()->Int{
        precondition(self.isTreeEmpty() == false, "Tree is empty! please insert some element fist")
        
        if (self.currentNode?.right == nil){ //Base condition to terminate the recursion
            let data:Int = (self.currentNode?.data)!;
            self.resetCurrentNodePointer()
            return data;
        }
        self.currentNode = self.currentNode?.right
        return findMax();
    }
    
    //Check a number is in tree or not
    func findNumber(number:Int)->Bool{
        precondition(self.isTreeEmpty() == false, "Tree is empty! please insert some element fist")
        var numberFound = false;
        
        if (self.currentNode?.data == number){
            self.resetCurrentNodePointer()
            return true;
        }
        
        if (self.currentNode == nil) {
            self.resetCurrentNodePointer()
            return false;
        }
        
        if number < self.currentNode?.data{
            self.currentNode = self.currentNode?.left;
        }else{
            self.currentNode = self.currentNode?.right;
        }
        
        numberFound = findNumber(number);
        
        return numberFound;
    }
    
    //Calculate the height of tree
    func height()->Int{
        guard !self.isTreeEmpty() else{ //If tree is empty simply return height as 0
            return -1
        }
        self.currentNode = self.root;
        return self.getHeightForRootNode(self.currentNode!);
    }
    
    func levelOrderTraversal(){
        
    }
    
    //Method to check if tree is binary search tree
    func isBinarySearchTree(node:Node?)->Bool{
        precondition(self.isTreeEmpty() == false, "Tree is empty!")
        return self.isBST(node!, minimum:Int(INT8_MIN) , maximum: Int(INT8_MAX))
    }
    
    //Delete node with specified data from tree
    func remove(data:Int)->Bool{
        return false
    }
}

