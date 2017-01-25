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
    
    //get the first item from list
    public func firstItem()throws->Element
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        return (head?.data)!
    }
    
    //get the last item from list
    public func lastItem()throws->Element
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        var nodeRef = head;
        
        while(nodeRef?.next != nil){
            nodeRef = nodeRef?.next
        }
        
        return (nodeRef?.data)!
        
    }
    
    fileprivate func insert(node _nodeToBeInserted:ListNode<Element>, atIndex index:Int)
    {
        var indexCounter = 0
        var nodeRef = head;
        
        while(nodeRef?.next != nil){
            
            //index found
            if (indexCounter == index-1)
            {
                break;
            }
            
            nodeRef = nodeRef?.next
            indexCounter += 1 //increase the index counter
            
            
        }
        
        //create new node and link it
        _nodeToBeInserted.next = nodeRef?.next
        nodeRef?.next = _nodeToBeInserted
    }
    
    //get an item from list based on index value
    fileprivate func item(atIndex _index:Int)throws ->ListNode<Element>
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        let count = self.count()
        if(_index>count)
        {
            //throw out of bound exception
            throw ListException.IndexOutOfBound
        }
        
        var nodeRef = head
        var counter = 0
        
        while(nodeRef?.next != nil){
            
            if(counter == _index)
            {
                break;
            }
            
            nodeRef = nodeRef?.next
            counter += 1
        }
        
        return nodeRef!;
    }

}

enum ListException: Error {
    case Empty
    case IndexOutOfBound
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
    
    //Check if item is exist
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
    
    //insert the item at a specific index in list
    public func insert(item _item:Element, atIndex index:Int)throws
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        let count = self.count()
        if(index>count)
        {
            //throw out of bound exception
            throw ListException.IndexOutOfBound
        }
        
        if (index == count)
        {
            //insert as last item
            do
            {
                try self.insert(item: _item)
            }
        }else if (index == 0)
        {
            //insert as first item in list
            self.append(item: _item)
        }else{
            //Insert in between the list
            let nodeToBeInserted = ListNode(data: _item)
            self.insert(node: nodeToBeInserted, atIndex: index)
        }
    
    }
    
    //insert item at last
    public func insert(item _item:Element)throws
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        var nodeRef = head;
        
        while(nodeRef?.next != nil){
            nodeRef = nodeRef?.next
        }
        
        //at end of loop we will get the last node in the list
        let nodeToBeInserted = ListNode(data: _item)
        nodeRef?.next = nodeToBeInserted
    }
    
    //get an item from list based on index value
    public func item(atIndex _index:Int)throws ->Element
    {
        do{
            let node:ListNode<Element>  = try item(atIndex: _index)
            return node.data
        }catch let exexption
        {
            throw exexption
        }
    }
    
    public func removeItem(atIndex _index:Int)throws
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        var listItemToRemove:ListNode<Element>?
        
        //If item to be removed a head item
        if(_index == 0)
        {
            listItemToRemove = head!;
            head = head?.next
        }else{
            //Traverse till index-1 node and adjust the link
            var nodeRef = head
            var counter = 0
            
            while(nodeRef?.next != nil){
                
                if(counter == _index-1)
                {
                    listItemToRemove = nodeRef?.next
                    break;
                }
                
                nodeRef = nodeRef?.next
                counter += 1
            }
            
            if (listItemToRemove == nil)
            {
                throw ListException.IndexOutOfBound
            }
            
            if (nodeRef != nil)
            {
                nodeRef?.next = listItemToRemove?.next
            }
        }
        
        
        
        listItemToRemove = nil
    }
    
    
    func reverseList()throws
    {
        //If link list is empty then simply throw the empty list exception
        if (head == nil) {
            throw ListException.Empty
        }
        
        var current,previous,next:ListNode<Element>?
        
        current = head
       // next = current?.next
        
        while(current != nil){
            head = current
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
    }
}
