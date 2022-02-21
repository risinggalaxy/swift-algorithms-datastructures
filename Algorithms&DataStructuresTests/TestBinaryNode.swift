//
//  TestBinaryNode.swift
//  Algorithms&DataStructuresTests
//
//  Created by YASSER FARAHI on 21/02/2022.
//

import XCTest
@testable import Algorithms_DataStructures

class TestBinaryNode: XCTestCase {
    
    var sut: BinaryNode!
    
    override func setUp() {
        super.setUp()
        sut = BinaryNode(10)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testBinaryNode_WhenRunningFirstTime_RootKeyShouldBeTen() {
        XCTAssertEqual(sut.key, 10)
    }
    
    func testBinaryNode_WhenRunningFirstTime_LeftAndRightNodeShouldBeNil() {
        XCTAssertNil(sut.left)
        XCTAssertNil(sut.right)
    }
    
    func testBinaryNode_WhenRunning_LeftNodeShouldBeNil_RightShouldNotBeNil() {
        let rightNode = BinaryNode(15)
        sut.right = rightNode
        XCTAssertNil(sut.left)
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.right)
    }
    
    func testBinaryNode_WhenRunningLeftNodeShouldNotBeNil_RightShouldBeNil() {
        let leftNode = BinaryNode(5)
        sut.left = leftNode
        XCTAssertNil(sut.right)
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.left)
    }
    
    func testBinaryNode_WhenRunning_MinValueShouldBeEqualToOne() {
        let leftNode = BinaryNode(5)
        let rightNode = BinaryNode(15)
        sut.left = leftNode
        sut.right = rightNode
        let four = BinaryNode(4)
        leftNode.left = four
        let three = BinaryNode(3)
        four.left = three
        let one = BinaryNode(1)
        three.left = one
        let min = sut.min.key
        XCTAssertEqual(min, 1)
        
    }

}
