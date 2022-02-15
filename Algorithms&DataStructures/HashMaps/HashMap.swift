//
//  HashMap.swift
//  Algorithms&DataStructures
//
//  Created by YASSER FARAHI on 15/02/2022.
//

import Foundation

class HashMap: HashMapInterFace {
    
    typealias T = String
    typealias H = HashMapEntry
    
    private static let initialCapacity: Int = 256
    
    var entries = Array<H?>(repeating: nil, count: initialCapacity)
    
    var count: Int {
        var counter = 0
        for i in 0..<entries.count {
            if entries[i] != nil {
                counter += 1
            }
        }
        return counter
    }
    
    var capacity: Int {
        return HashMap.initialCapacity
    }
    
    func add(_ key: T, _ value: T) {
        let index = getIndex(key)
        let entry = HashMapEntry(key, value)
        
        if entries[index] == nil {
            entries[index] = entry
        } else {
            var collision = entries[index]
            while collision?.nextNode != nil {
                collision = collision?.nextNode
            }
            collision?.nextNode = entry
        }
    }
    
    func get(_ key: T) -> T? {
        let index = getIndex(key)
        let possibleCollision = entries[index]
        var currentEntry = possibleCollision
        
        while currentEntry != nil {
            if currentEntry?.key == key {
                return currentEntry?.value
            }
            currentEntry = currentEntry?.nextNode
        }
        return nil
    }
    
    func getIndex(_ key: T) -> Int {
        let hash = key.hashValue
        let index = abs(hash % HashMap.initialCapacity)
        return index
    }
    
    subscript(key: T) -> T? {
        get {
            self.get(key)
        }
        set(newValue) {
            guard let value = newValue else { return }
            add(key, value)
        }
    }
}
