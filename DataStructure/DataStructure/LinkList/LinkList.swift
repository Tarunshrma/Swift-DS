//
//  LinkList.swift
//  DataStructure
//
//  Created by Tarun Sharma on 1/17/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import Foundation

//helper methods
extension LinkList{
    
    //return the count of list
    public func count()->Int{
        var count = 0
        var nodeRef = head;
        while (nodeRef != nil) {
            count += 1
            nodeRef = nodeRef?.next
        }
        
        return count;
    }
    
    //Check if link list is empty
    public func isEmpty()->Bool
    {
        return count() == 0 ? true : false
    }
}

enum ListException: Error {
    case Empty
}

public class LinkList<Element:Comparable>
{
    //Head node of linked list pointing to first elemnt of list
    fileprivate var head:ListNode<Element>?;
    
    //Empty list with head pointing to nil
    init() {
        head = nil
    }
    
    init(item _item:Element) {
        //Create a node and set the head pointing to that node
        let headNode = ListNode(data: _item)
        head = headNode;
    }
    
    
    init(items _items:[Element]){
        for item:Element in _items
        {
            append(item: item)
        }
    }
    
    //Add an item to begenning of the list
    public func append(item _item:Element)
    {
        let node = ListNode(data: _item)
        node.next = head
        head = node
    }
    
    public func itemExist(item _item:Element)throws ->Bool
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        var isExist = false
        
        var nodeRef = head;
        
        while(nodeRef != nil){
            
            if (nodeRef!.data == _item)
            {
                isExist = true;
                break;
            }
            
            nodeRef = nodeRef?.next
        }
        
        return isExist
    
    }
}
