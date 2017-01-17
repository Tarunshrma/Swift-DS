//
//  Stack.swift
//  DataStructure
//
//  Created by SANCHIT SHARMA on 14/05/16.
//  Copyright © 2016 Tarun Sharma. All rights reserved.
//

import Foundation

enum StackException: Error {
    case stackOverFlow
    case stackEmpty
}

class Stack  {
    let defaultCapacity = 100;
    fileprivate var arrItems:NSMutableArray;
    fileprivate var top:NSInteger = -1;
    
    init(){
        self.arrItems = NSMutableArray(capacity:defaultCapacity);
    }
    
    init(capacity:NSInteger){
        self.arrItems = NSMutableArray(capacity:capacity);
    }
    
    func isEmpty()->Bool{
        return (top<0 ? true:false)
    }
    
    
    func push(_ object:AnyObject) throws{
        //Check if stack overflow exception occured else just push the element at top position
        if (top == (defaultCapacity-1)){
            throw StackException.stackOverFlow
        }

        top += 1;
        self.arrItems.insert(object, at: top);
    }
    
    func pop()throws ->AnyObject{
        if (isEmpty()){
           throw StackException.stackEmpty
        }
        
        let obj =  self.arrItems[top]
        top = top - 1;
        return obj as AnyObject;
        
    }
    
    func peek()throws ->AnyObject{
        if (isEmpty()){
            throw StackException.stackEmpty
        }
        
        return self.arrItems[top] as AnyObject
    }
}
