//
//  HashMapTest.swift
//  Algorithms&DataStructuresTests
//
//  Created by YASSER FARAHI on 15/02/2022.
//

import XCTest
@testable import Algorithms_DataStructures

class TestHashMap: XCTestCase {
    
    var sut: HashMap!
    var input: (key: String, value: String)!
    
    override func setUp() {
        super.setUp()
        sut = HashMap()
        input = (key: "1", value: "One")
        sut.add(input.key, input.value)
    }
    
    override func tearDown() {
        input = nil
        sut = nil
        super.tearDown()
    }

    func testHashMap_WhenKeyProvided_ShouldReturnIndex() {
        let key: String = "Test"
        let index = sut.getIndex(key)
        XCTAssertEqual(sut.getIndex(key), index)
    }
    
    func testHashMap_WhenAddingKeyValue_RetrievedValueShouldBeEqualToGivenValue() {
        let result = sut[input.key]
        XCTAssertEqual(result, input.value)
    }
    
    func testHashMap_WhenGettingValue_RetrievedValueShouldBeEqualToGivenValue() {
        let result = sut.get(input.key)
        XCTAssertEqual(result, input.value)
    }
    
    func testHashMap_WhenSettingValue_SubscriptSyntaxShouldSetTheValueForGivenKey() {
        let greeting: String = "Hello World"
        let testKey: String = "Test"
        sut[testKey] = greeting
        let result = sut.get(testKey)
        XCTAssertEqual(result, greeting)
    }
}
