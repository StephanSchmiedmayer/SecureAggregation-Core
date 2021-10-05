//
//  File.swift
//  
//
//  Created by stephan on 21.09.21.
//

import XCTest
import CryptoKit

@testable import SecureAggregationCore

/// `SAWrappedValue` that provides enough information for  `SecureAggregationWrappedValueTests`
protocol TestableSAWrappedValue: SAWrappedValue {
    
    /// An example modulus
    ///
    /// Must be reasonably big enough for testing.
//    static var modulus: Modulus { get }
    
    /// Combinations of values and modulo that can be problematic and should be tested.
//    static var combinationsToTest: [([Value], Modulus)] { get }
    
    /// Sample masks for testing cancelling
//    static var sampleMasks: [Value] { get }
}

/// A template for testing metamorphic relashionships that must hold for all instances of SAWrappedValue.
///
/// Provides convenience functions to test certain behavior of `WrappedValue`
class SecureAggregationWrappedValueTests<WrappedValue: TestableSAWrappedValue>: XCTestCase {
    // Sample userIDs usable
    private let userIDa: UserID = 0
    private let userIDb: UserID = 1
    
    typealias Modulus = WrappedValue.Modulus
    typealias Value = WrappedValue.Value
    
    // MARK: - Arithmetic tests
    
    // MARK: Neutral element
    
    // TODO: test neutral element
    /// Tests if `value + Value.zero = value`
    func testZeroAdditionIdempotenz(value: WrappedValue, mod: Modulus) {
        testAddition(value, plus: WrappedValue.zero, shouldEqual: value, mod: mod)
    }
    
    // MARK: Associativity & Commutativity for addition & subtraction
    
    // TODO: test Associativity, Commutativity für addition, subtraction
    
    // MARK: - Masking tests
    /// Test if `Value.cancelling` results in cancelling masks.
    ///
    /// Needs ot take into account ownID and otherID so that for any valid  `mask`, `mod`, `a`, `b`:
    ///
    ///     let maskA = mask.cancelling(ownID: a, otherID: b)
    ///     let maskB = mask.cancelling(ownID: b, otherID: a)
    ///     let zero = maskA.add(maskB, mod)
    ///     zero == Value.zero
    ///     value.add(zero, mod) == value
    ///
    /// holds (meaning zero is a representation of 0 / masks cancel each other out). This is curtial to SecureAggregation.
    func testCancellingMask(forMask mask: WrappedValue, mod: Modulus) {
        let maskA = mask.cancelling(ownID: userIDa, otherID: userIDb, mod: mod)
        let maskB = mask.cancelling(ownID: userIDb, otherID: userIDa, mod: mod)
        let shouldBeZero = maskA.add(maskB, mod: mod)
        XCTAssertEqual(shouldBeZero, WrappedValue.zero,
                       "mask: \(mask), userIDa: \(userIDa), userIDb: \(userIDb)")
    }
    
    // MARK: - Helper
    
    /// Checks if `firstArgument + secondArgument = expectedResult mod mod`
    func testAddition(_ firstArgument: WrappedValue,
                      plus secondArgument: WrappedValue,
                      shouldEqual expectedResult: WrappedValue, mod: Modulus) {
        XCTAssertEqual(firstArgument.add(secondArgument, mod: mod),
                       expectedResult,
                       "\(firstArgument) + \(secondArgument) does not equal \(expectedResult) mod \(mod)")
    }
    
    /// Convenience wrapper for ``testAddition(_:plus:shouldEqual:mod:)``
    func testAddition(_ firstArgument: Value,
                      plus secondArgument: Value,
                      shouldEqual expectedResult: Value, mod: Modulus) {
        testAddition(WrappedValue(firstArgument, mod: mod),
                     plus: WrappedValue(secondArgument, mod: mod),
                     shouldEqual: WrappedValue(expectedResult, mod: mod),
                     mod: mod)
    }
    
    /// Checks if `firstArgument - secondArgument = expectedResult mod mod`
    func testSubtraction(_ firstArgument: WrappedValue,
                         plus secondArgument: WrappedValue,
                         shouldEqual expectedResult: WrappedValue, mod: Modulus) {
        XCTAssertEqual(firstArgument.sub(secondArgument, mod: mod),
                       expectedResult,
                       "\(firstArgument) - \(secondArgument) does not equal \(expectedResult) mod \(mod)")
    }
    
    /// Convenience wrapper for ``testSubtraction(_:plus:shouldEqual:mod:)``
    func testSubtraction(_ firstArgument: Value,
                         plus secondArgument: Value,
                         shouldEqual expectedResult: Value, mod: Modulus) {
        testSubtraction(WrappedValue(firstArgument, mod: mod),
                        plus: WrappedValue(secondArgument, mod: mod),
                        shouldEqual: WrappedValue(expectedResult, mod: mod),
                        mod: mod)
    }
}
