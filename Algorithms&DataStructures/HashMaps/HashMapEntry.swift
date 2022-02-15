//
//  HashMapEntry.swift
//  Algorithms&DataStructures
//
//  Created by YASSER FARAHI on 15/02/2022.
//

import Foundation

class HashMapEntry: HashMapEntryInterface {
    
    typealias T = String
    typealias H = HashMapEntry
    
    var key: T
    var value: T
    var nextNode: H?
    
    required init(_ key: T, _ value: T) {
        self.key = key
        self.value = value
    }

}
