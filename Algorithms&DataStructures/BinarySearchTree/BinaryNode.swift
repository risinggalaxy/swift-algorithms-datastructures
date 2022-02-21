//
//  BinaryNode.swift
//  Algorithms&DataStructures
//
//  Created by YASSER FARAHI on 21/02/2022.
//

import Foundation

class BinaryNode: BinaryNodeInterface {
    
    typealias T = BinaryNode
    
    var key: Int
    var left: T?
    var right: T?
    var min: T {
        if left == nil {
            return self
        } else {
            return left!.min
        }
    }
    
    required init(_ key: Int) {
        self.key = key
    }
    
}
