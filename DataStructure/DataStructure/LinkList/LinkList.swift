//
//  LinkList.swift
//  DataStructure
//
//  Created by Tarun Sharma on 1/17/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import Foundation

enum ListException: Error {
    case Empty
}

public class LinkList<Element:Comparable>
{
    //Head node of linked list pointing to first elemnt of list
    private var head:ListNode<Element>?;
    
    init(data:Element) {
        //Create a node and set the head pointing to that node
        let headNode = ListNode(data: data)
        head = headNode;
    }
    
    //Add an item to begenning of the list
    public func add(data _data:Element)
    {
        let node = ListNode(data: _data)
        node.next = head
        head = node
    }
    
    public func itemExist(item _item:Element)->Bool
    {
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
