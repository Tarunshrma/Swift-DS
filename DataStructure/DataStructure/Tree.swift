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
}

class Tree{
    
    var root:Node?;
    
    private var currentNode:Node?
    
    init(){
        self.root = Node();
        self.currentNode = root;
    }
    
    //Initialize the root node with data
    init(rootNode:Int?){
        self.root = Node();
        if let data = rootNode{
            self.putData(inNode: self.root, data: data);
        }
        
        self.currentNode = root;
    }
    
    func insertData(_data:Int) -> Node {
        var node:Node? = self.currentNode;
        
        if (self.isTreeEmpty()){
            self.putData(inNode: node!, data: _data);
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
    
//    //Calculate the height of tree
    func height()->Int{
        
    }
    
    func levelOrderTraversal(){
        
    }
    
    
}

