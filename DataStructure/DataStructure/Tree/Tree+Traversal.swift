//
//  File.swift
//  DataStructure
//
//  Created by Tarun Sharma on 9/12/16.
//  Copyright © 2016 Tarun Sharma. All rights reserved.
//

extension Tree{
    fileprivate func printNodeData(_ node:Node){
        print(node.data);
    }
}

//Depth First Traversal (in-order, pre-order, post-order)
extension Tree{
    //L-D-R
    //Traverse left subtreez
    //read root
    //traverse right subtree
    func InOrderTraversal(_ node:Node?){
        if node == nil{
            return
        }
        
        InOrderTraversal(node!.left)
        self.printNodeData(node!)
        InOrderTraversal(node!.right)
    }
    
    //D-L-R
    func PreOrderTraversal(_ node:Node?){
        
        if node == nil{
            return
        }
        
        self.printNodeData(node!)
        PreOrderTraversal(node!.left)
        PreOrderTraversal(node!.right)
    }
    
    //L-R-D
    func PostOrderTraversal(_ node:Node?){
        
        if node == nil{
            return
        }
        
        PostOrderTraversal(node!.left)
        PostOrderTraversal(node!.right)
        self.printNodeData(node!)
    }
    
    //Depth First Traversal
    func DFSTraversal(_ node:Node?){
        //Psudo Code
        //Traverse a node.
        //keep all of its child in a queue (FIFO)
        //dequeue a queue and recurselvy call the above steps
        
    }
    

}
