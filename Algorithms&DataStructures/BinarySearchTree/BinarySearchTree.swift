//
//  BinarySearchTree.swift
//  Algorithms&DataStructures
//
//  Created by YASSER FARAHI on 21/02/2022.
//

import Foundation

class BinarySearchTree: BinarySearchTreeInterface {
    
    typealias T = BinaryNode
    
    internal var root: T?
    
    public internal (set) var treeOrder: [Int] = []
    
    public func insert(_ key: Int) {
        root = insert(root, key)
    }
    
    internal func insert(_ node: T?, _ key: Int) -> T {
        guard let insideNode = node else {
            let newNode = T(key)
            return newNode
        }
        if key < insideNode.key {
            insideNode.left = insert(insideNode.left, key)
        } else if key > insideNode.key {
            insideNode.right = insert(insideNode.right, key)
        }
        return insideNode
    }
    
    public func find(_ key: Int) -> T? {
        guard let rootNode = root else { return nil }
        guard let node = find(rootNode, key) else { return nil }
        return node
    }
    
    internal func find(_ node: T?, _ key: Int) -> T? {
        guard let insideNode = node else { return nil }
        if key == insideNode.key {
            return insideNode
        } else if key < insideNode.key {
            return find(insideNode.left, key)
        } else if key > insideNode.key {
            return find(insideNode.right, key)
        }
        return insideNode
    }
    
    public func findMin() -> Int {
        guard let rootNode = root else { return .zero }
        guard let node = findMin(rootNode) else { return .zero}
        return node.key
    }
    
    internal func findMin(_ node: T) -> T? {
        return node.min
    }
    
    public func delete(_ key: Int) {
        guard root != nil else { return }
        delete(&root, key)
    }
    
    @discardableResult
    internal func delete(_ node: inout T?, _ key: Int) -> T? {
        guard let insideNode = node else { return nil }
        
        if key < insideNode.key {
            insideNode.left = delete(&insideNode.left, key)
        } else if key > insideNode.key {
            insideNode.right = delete(&insideNode.right, key)
        } else {
         
            if insideNode.left == nil && insideNode.right == nil {
                return nil
            } else if insideNode.left == nil {
                return insideNode.right
            } else if insideNode.right == nil {
                return insideNode.left
            } else {
                guard let rightNode = insideNode.right else { return nil }
                guard let minRight = findMin(rightNode) else { return nil }
                insideNode.key = minRight.key
                insideNode.right = delete(&insideNode.right, insideNode.key)
            }
        }
        return insideNode
    }
    
    public func traverse(_ mode: Traversal) {
        switch mode {
        case .inOrder:
            inOrder(root)
        case .preOrder:
            preOrder(root)
        case .postOrder:
            postOrder(root)
        }
    }
    
    internal func inOrder(_ node: T?)  {
        guard let insideNode = node else { return }
        inOrder(insideNode.left)
        treeOrder.append(insideNode.key)
        inOrder(insideNode.right)
    }
    
    internal func preOrder(_ node: T?) {
        guard let insideNode = node else { return }
        treeOrder.append(insideNode.key)
        preOrder(insideNode.left)
        preOrder(insideNode.right)
    }
    
    internal func postOrder(_ node: T?) {
        guard let insideNode = node else { return }
        postOrder(insideNode.left)
        postOrder(insideNode.right)
        treeOrder.append(insideNode.key)
    }
    
}
