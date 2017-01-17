//
//  Node.swift
//  DataStructures
//
//  Created by Tarun Sharma on 9/1/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


let kDefaultGarbageValue:Int = -99999999;

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
    fileprivate func putData(inNode node:Node!, data:Int){
        node.data = data;
        self.resetCurrentNodePointer()
    }
    
    //This method will reset the current pointer to root node for fresh traversal
    fileprivate func resetCurrentNodePointer(){
        self.currentNode = self.root;
    }
    
    fileprivate func getHeightForRootNode(_ node:Node?)->Int{
        
        guard let aNode = node else{
            return -1
        }
        
        let leftSubTreeHeight = getHeightForRootNode(aNode.left)
        let rightSubTreeHeight = getHeightForRootNode(aNode.right)
        
        return max(leftSubTreeHeight,rightSubTreeHeight) + 1
    }
    
    fileprivate func createBinaryTreeWithElements(_ elements:[Int]){
        for element in elements{
            self.insertData(element)
        }
    }
    
    // MARK: Utility methods for checking is binary search tree
    fileprivate func isBST(_ node:Node?,minimum min:Int,maximum max:Int)->Bool{
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
    
    fileprivate func isNodeInValidRange(_ node:Node,minimum min:Int,maximum max:Int)->Bool{
        var isNodeInValidRange:Bool = false
        if (node.data>=min && node.data<max){
            isNodeInValidRange = true
        }
        return isNodeInValidRange
    }
    
    
    fileprivate func removeNode(_ rootNode:Node?, data:Int) ->Node?{
        
        guard let node = rootNode else{
            return nil
        }
        
        if(data<node.data){
            //if data to be deleted is lesser then root node then try to remove node from left subtree
            node.left = removeNode(node.left, data: data)
        }else if (data>node.data){
            //if data to be deleted is greater then root node then try to remove node from right subtree
            node.right = removeNode(node.right, data: data)
        }else{
            var aNode:Node?
            //else if data is equal to root node data delete it
            if(node.left == nil && node.right == nil){
                //If node if lead level 
                //simply delete set the node to nil and return
                aNode = nil
                return aNode
            }else if (node.left == nil){
                //else if it has one child i.e. right
                //set the replace the current node data to right child and try to remove right child
                node.data = (node.right?.data)!
                node.right = removeNode(node.right, data: node.data)
            }else if (node.right == nil){
                //else if it has one child i.e. left
                //set the replace the current node data to left child and try to remove left child
                node.data = (node.left?.data)!
                node.left = removeNode(node.left, data: node.data)
            }else{
                //else node has both the childs
                //either find the max of left subtree or min of right subtree say temp node
                //replace the data of node to temp data
                //remove the node from left/right subtree (based on left subtree selected or right) by changing the data to be removed as temp data
                aNode = findMin(node.right)
                node.data = (aNode?.data)!
                node.right = removeNode(node.right, data: (aNode?.data)!)
            }
            
            
            
        }
        
        
       return node
    }
    
}

class Tree{
    
    var root:Node?;
    
    fileprivate var currentNode:Node?
    
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
    
    func insertData(_ _data:Int) -> Node {
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
    func findMin(_ rootNode:Node?)->Node{
        precondition(self.isTreeEmpty() == false, "Tree is empty! please insert some element fist")
        
        if (rootNode?.left == nil){ //Base condition to terminate the recursion
            return rootNode!;
        }
        return findMin(rootNode?.left);
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
    func findNumber(_ number:Int)->Bool{
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
    func isBinarySearchTree(_ node:Node?)->Bool{
        precondition(self.isTreeEmpty() == false, "Tree is empty!")
        return self.isBST(node!, minimum:Int(INT8_MIN) , maximum: Int(INT8_MAX))
    }
    
    //Delete node with specified data from tree
    func remove(_ data:Int){
        precondition(self.isTreeEmpty() == false, "Tree is empty!")
        self.removeNode(self.root, data: data)
    }
}

