//
//  File.swift
//  
//
//  Created by stephan on 21.09.21.
//

import XCTest
@testable import SecureAggregationCore

// Test your custom SAWrappedValues here with `SAWrappedValueTest`
// Make sure SAWrappedValue conforms to TestableSAWrappedValue (e.g. via fileprivate extension)

extension SAInt: TestableSAWrappedValue {
    static var combinationsToTest: [([Int], Int)] {
        [
//        ([], 1)
        ]
    }
    
    static var modulus: Int {
        307
    }
    
    public static func == (lhs: SAInt, rhs: SAInt) -> Bool {
        lhs.value == rhs.value
    }
}

class SAIntTest: SecureAggregationWrappedValueTests<SAInt> {
    func testInitialization() {
        XCTAssertEqual(SAInt(11, mod: 10), SAInt(1, mod: 10))
        XCTAssertEqual(SAInt(10, mod: 10), SAInt(0, mod: 10))
        XCTAssertEqual(SAInt(-1, mod: 10), SAInt(9, mod: 10))
        XCTAssertEqual(SAInt(-11, mod: 10), SAInt(9, mod: 10))
    }
    
    func testAddition() {
        XCTAssertEqual(SAInt(1, mod: 10).add(SAInt(9, mod: 10), mod: 10), SAInt(0, mod: 10))
        XCTAssertEqual(SAInt(2, mod: 10).add(SAInt(7, mod: 10), mod: 10), SAInt(9, mod: 10))
        XCTAssertEqual(SAInt(0, mod: 10).add(SAInt(1, mod: 10), mod: 10), SAInt(1, mod: 10))
        XCTAssertEqual(SAInt(9, mod: 10).add(SAInt(9, mod: 10), mod: 10), SAInt(8, mod: 10))
    }
    
    func testSubtraction() {
        XCTAssertEqual(SAInt(9, mod: 10).sub(SAInt(1, mod: 10), mod: 10), SAInt(8, mod: 10))
        XCTAssertEqual(SAInt(9, mod: 10).sub(SAInt(5, mod: 10), mod: 10), SAInt(4, mod: 10))
        XCTAssertEqual(SAInt(3, mod: 10).sub(SAInt(5, mod: 10), mod: 10), SAInt(8, mod: 10))
        XCTAssertEqual(SAInt(0, mod: 10).sub(SAInt(1, mod: 10), mod: 10), SAInt(9, mod: 10))
    }
}
