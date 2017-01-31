//
//  Stack.swift
//  DataStructure
//
//  Created by Tarun Sharma on 1/31/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import Foundation

//Helper methods
extension StackList
{
    fileprivate func isEmpty()->Bool{
        return (top == nil ? true:false)
    }
}

//Stack implementation with link list
class StackList<Element:Comparable> {
    
    fileprivate var top:ListNode<Element>? = nil
    
    public func push(item _item:Element)
    {
        //Create new node
        let node:ListNode<Element> = ListNode(data: _item)
        
        let next = top
        top = node
        top!.next = next
        
    }
    
    public func pop()throws
    {
        if (isEmpty()){
            throw StackException.stackEmpty
        }
        
        var temp = top
        top = temp?.next
        
        temp = nil
    }
    
    public func peek()throws -> Element
    {
        if (isEmpty()){
            throw StackException.stackEmpty
        }
        
        return top!.data
    }
}
