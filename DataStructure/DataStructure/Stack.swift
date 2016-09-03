//
//  Stack.swift
//  DataStructure
//
//  Created by SANCHIT SHARMA on 14/05/16.
//  Copyright © 2016 Tarun Sharma. All rights reserved.
//

import Foundation

enum StackException: ErrorType {
    case StackOverFlow
    case StackEmpty
}

class Stack  {
    let defaultCapacity = 100;
    private var arrItems:NSMutableArray;
    private var top:NSInteger = -1;
    
    init(){
        self.arrItems = NSMutableArray(capacity:defaultCapacity);
    }
    
    init(capacity:NSInteger){
        self.arrItems = NSMutableArray(capacity:capacity);
    }
    
    func isEmpty()->Bool{
        return (top<0 ? true:false)
    }
    
    
    func push(object:AnyObject) throws{
        //Check if stack overflow exception occured else just push the element at top position
        if (top == (100-1)){
            throw StackException.StackOverFlow
        }

        top += 1;
        self.arrItems.insertObject(object, atIndex: top);
    }
    
    func pop()throws ->AnyObject{
        if (isEmpty()){
           throw StackException.StackEmpty
        }
        
        let obj =  self.arrItems[top]
        top = top - 1;
        return obj;
        
    }
    
    func peek()throws ->AnyObject{
        if (isEmpty()){
            throw StackException.StackEmpty
        }
        
        return self.arrItems[top]
    }
}