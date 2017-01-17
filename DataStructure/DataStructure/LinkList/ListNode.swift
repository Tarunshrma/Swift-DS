//
//  Node.swift
//  DataStructure
//
//  Created by Tarun Sharma on 1/17/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

public class ListNode<Element>{
    internal var data:Element
    internal var next:ListNode?
    
    init(data:Element) {
        self.data = data
    }
}
