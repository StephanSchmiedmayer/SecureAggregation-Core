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
protocol TestableSAWrappedValue: SAWrappedValue, Equatable {
    
    /// An example modulus
    ///
    /// Must be reasonably big enough for testing.
    static var modulus: Modulus { get }
}

class SecureAggregationWrappedValueTests<Value: TestableSAWrappedValue>: XCTestCase {
    // Sample userIDs usable
    private let userIDa: UserID = 0
    private let userIDb: UserID = 1
    private let mod: Value.Modulus = Value.modulus
    
    func testZeroAdditionIdempotenz() {
        XCTAssertEqual(Value.zero,
                       Value.zero.add(Value.zero, mod: Value.modulus))
    }
        
    /// Test the property of Value.
    ///
    /// Needs ot take into account ownID and otherID so that for any valid  `seed`, `mod`, `a`, `b`:
    ///
    ///     let mask = mask(seed, mod)
    ///     let maskA = mask.cancelling(ownID: a, otherID: b)
    ///     let maskB = mask.cancelling(ownID: b, otherID: a)
    ///     let zero = maskA.add(maskB, mod)
    ///     value.add(zero, mod) == value
    ///
    /// holds (meaning zero is a representation of 0 / masks cancel each other out). This is curtial to SecureAggregation.

    func testCancellingMask() {
        let mask = Value.mask(forSeed: getSharedSecret(), mod: mod)
        let maskA = mask.cancelling(ownID: userIDa, otherID: userIDa, mod: mod)
        let maskB = mask.cancelling(ownID: userIDb, otherID: userIDa, mod: mod)
        let zero = maskA.add(maskB, mod: mod)
        XCTAssertEqual(zero, Value.zero)
    }
    
    // MARK: - Helper
    /// Creates a random shared secret
    func getSharedSecret() -> SharedSecret {
        let privateKey1 = SAPubKeyCurve.KeyAgreement.PrivateKey()
        let privateKey2 = SAPubKeyCurve.KeyAgreement.PrivateKey()
        return try! privateKey1.sharedSecretFromKeyAgreement(with: privateKey2.publicKey)
    }
}
