//
//  QueueProtocol.swift
//  DataStructure
//
//  Created by Tarun Sharma on 3/6/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import Foundation
protocol QueueProtocol {
    associatedtype Element
    
    func enqueue(item _item:Element)
    func dequeue()throws-> Element
    func isEmpty()->Bool
}
