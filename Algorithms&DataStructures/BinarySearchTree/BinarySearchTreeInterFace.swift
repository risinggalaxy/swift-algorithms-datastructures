//
//  BinarySearchTreeInterFace.swift
//  Algorithms&DataStructures
//
//  Created by YASSER FARAHI on 21/02/2022.
//

import Foundation

enum Traversal {
    case inOrder, preOrder, postOrder
}

protocol BinaryNodeInterface {
    associatedtype T: BinaryNodeInterface
    var key: Int { get set }
    var left: T? { get set }
    var right: T? { get set }
    var min: T { get }
    init(_ key: Int)
}

protocol BinarySearchTreeInterface {
    associatedtype T: BinaryNodeInterface
    var root: T? { get set }
    var treeOrder: [Int] { get set }
    func insert(_ key: Int)
    func insert(_ node: T?, _ key: Int) -> T
    func find(_ key: Int) -> T?
    func find(_ node: T?, _ key: Int ) -> T?
    func findMin() -> Int
    func findMin(_ node: T) -> T?
    func delete(_ key: Int)
    func delete(_ node: inout T?, _ key: Int) -> T?
    func traverse( _ mode: Traversal )
    func inOrder( _ node: T?)
    func preOrder( _ node: T?)
    func postOrder( _ node: T?)
}
