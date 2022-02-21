//
//  TestBinarySearchTree.swift
//  Algorithms&DataStructuresTests
//
//  Created by YASSER FARAHI on 21/02/2022.
//

import XCTest
@testable import Algorithms_DataStructures

class TestBinarySearchTree: XCTestCase {
    
    var sut: BinarySearchTree!
    
    override func setUp() {
        super.setUp()
        sut = BinarySearchTree()
        sut.insert(12)
        sut.insert(9)
        sut.insert(15)
        sut.insert(8)
        sut.insert(11)
        sut.insert(10)
        sut.insert(5)
        sut.insert(4)
        sut.insert(7)
        sut.insert(6)
        sut.insert(1)
        sut.insert(19)
        sut.insert(14)
        sut.insert(13)
        sut.insert(16)
        sut.insert(20)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testBinarySearchTree_FirstInsert_RootShouldBeNil_AfterInsertRootShouldNotBeNil() {
        let result = sut.root?.key
        XCTAssertNotNil(sut.root)
        XCTAssertEqual(result, 12)
    }
    
    func testBinarySearchTree_InsertingChildNodes_ShouldFindOne() {
        let result = sut.find(1)
        XCTAssertNotNil(result)
    }
    
    //Delete Node With No Child
    func testBinarySearchTree_WhenDeletingNodeWithNoChild_ShouldDeleteTwentyAndReturnNil() {
        sut.delete(20)
        let result = sut.find(20)
        XCTAssertNil(result)
    }
    
    //Delete Node With One Child
    func testBinarySearchTree_WhenDeletingNodeWithOneChild_ShouldDeleteElevenAndReturnTen() {
        guard let parentNode = sut.find(11) else { return }
        sut.delete(parentNode.key)
        let result = sut.find(parentNode.key)
        let childLeft = parentNode.left
        XCTAssertNil(result)
        XCTAssertNotNil(childLeft)
        XCTAssertEqual(childLeft!.key, 10)
        let newNode = sut.find(10)
        XCTAssertNotNil(newNode)
    }
    
    //Delete Node With Two Children
    func testBinarySearchTree_WhenDeletingNodeWithTwoChildren_ShouldDeleteNodeAndCopyItsMinimumOnRightAndReplaceTheRemovedNode() {
        guard let parentNode = sut.find(19) else { return }
        guard let minimumRight = parentNode.right?.min else { return }
        sut.delete(19)
        let result = sut.find(19)
        let newParentNode = sut.find(minimumRight.key)
        let leftNode = newParentNode?.left
        XCTAssertNil(result)
        XCTAssertEqual(minimumRight.key, 20)
        XCTAssertEqual(newParentNode?.key, minimumRight.key)
        XCTAssertNotNil(leftNode)
        XCTAssertEqual(leftNode?.key, 16)
    }
    
    func testBinarySearchTree_WhenTraversingInOrder_ResultShouldBeEqualToTheGivenArray() {
        let givenArray: [Int] = [1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 19, 20]
        sut.traverse(.inOrder)
        let result = sut.treeOrder
        XCTAssertEqual(result, givenArray)
    }
    
    func testBinarySearchTree_WhenTraversingPreOrder_ResultShouldBeEqualToTheGivenArray() {
        let givenArray: [Int] = [12, 9, 8, 5, 4, 1, 7, 6, 11, 10, 15, 14, 13, 19, 16, 20]
        sut.traverse(.preOrder)
        let result = sut.treeOrder
        XCTAssertEqual(result, givenArray)
    }
    
    func testBinarySearchTree_WhenTraversingPostOrder_ResultShouldBeEqualToTheGivenArray() {
        let givenArray: [Int] = [1, 4, 6, 7, 5, 8, 10, 11, 9, 13, 14, 16, 20, 19, 15, 12]
        sut.traverse(.postOrder)
        let result = sut.treeOrder
        XCTAssertEqual(result, givenArray)
    }
}
