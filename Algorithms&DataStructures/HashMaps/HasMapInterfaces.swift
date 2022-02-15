//
//  HasMapInterfaces.swift
//  Algorithms&DataStructures
//
//  Created by YASSER FARAHI on 15/02/2022.
//
import Foundation

public protocol HashMapEntryInterface {
    associatedtype T
    associatedtype H
    var key: T { get set}
    var value: T { get set }
    var nextNode: H? { get set }
    init( _ key: T, _ value: T)
}

public protocol HashMapInterFace {
    associatedtype T
    associatedtype H
    var count: Int { get }
    var capacity: Int { get }
    var entries:Array<H?> { get set }
    func add(_ key: T, _ value: T)
    func get(_ key: T) -> T?
    func getIndex(_ key: T) -> Int
    subscript(_ key: T) -> T? { get set }
}
