//
//  Queue.swift
//  DataStructure
//
//  Created by Tarun Sharma on 3/6/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import Foundation

private let DEFAULT_QUEUE_CAPACITY:Int = 10
private let DEFAULT_QUEUE_INDEX:Int = -1

// MARK: Custom exception
public enum QueueException: Error {
    case queueFull
    case queueEmpty
}

/// Queue data structure implementation using Array
public class Queue<Element> : QueueProtocol
{
    
    // MARK: Private member variables
    private var front:Int
    private var rear:Int
    private var _queue:[Element?]
    private let maxSize:Int  
    
    // MARK: Object lifecycle methods
    init(withSize size:Int) {
        _queue = [Element?](repeating: nil, count:size)
        front = DEFAULT_QUEUE_INDEX
        rear = DEFAULT_QUEUE_INDEX
        maxSize = size
    }
    
    convenience init() {
        self.init(withSize: DEFAULT_QUEUE_CAPACITY)
    }
    
    deinit {
        
    }
    
    // MARK: Public methods
    /**
     Add element to queue
     
     - parameter _item: item to be added in queue.
     */
    public func enqueue(item _item:Element)throws
    {
        if isEmpty(){
            front = 0
            rear = 0
        }else{
          //If next of rear is front then throw queue full exception, else move forward
          let next = (maxSize+(rear + 1)) %  maxSize
          
            if (next == front){
                throw QueueException.queueFull
            }
            
          rear = next
        }
        _queue[rear] = _item
    }
    
    /**
     remove element from queue
     
     - parameter _item: item to be added in queue.
     
     - returns: item to be removed
     */
    public func dequeue()throws-> Element
    {
        guard isEmpty() == false else{
            throw QueueException.queueEmpty
        }
        
        let element =  _queue[front]
        
        if (front == rear)
        {
            makeQueueEmpty()
        }else
        {
            front = (maxSize + (front + 1)) % maxSize
        }
        
        return element!
    }
    
    /**
     Check if queue is empty
     
     - returns: Bool indicating if queue is empty
     */
    public func isEmpty()->Bool
    {
        return front == DEFAULT_QUEUE_INDEX && rear == DEFAULT_QUEUE_INDEX
    }
    
    // MARK: Private methods
    private func makeQueueEmpty()
    {
        front = DEFAULT_QUEUE_INDEX
        rear = DEFAULT_QUEUE_INDEX
    }

}
