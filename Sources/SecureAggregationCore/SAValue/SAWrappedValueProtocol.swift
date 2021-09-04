//
//  File.swift
//  
//
//  Created by stephan on 02.09.21.
//

import Foundation
import CryptoKit
import Vapor

/// A wrapper providing all necessary operations for a secure aggregation
public protocol SAWrappedValue: Content {
    /// Valuetype that gets wrapped
    associatedtype Value: Content
    /// Value of the modulus defined for the type
    associatedtype Modulus: Content
    
    init(_ value: Value)
        
    // MARK: - arithmetic operations
    /// Modulo addition
    func add(_ rhs: Self, mod: Modulus) -> Self
    /// Modulo subtraction
    func sub(_ rhs: Self, mod: Modulus) -> Self

    // MARK: - cryptographic operations
    /// Creates a mask from a seed
    ///
    /// Needs ot take into account ownID and otherID so that for any valid `seed`, `mod`, `a`, `b`
    ///
    ///     let maskA = mask(seed, mod, a, b)
    ///     let maskB = mask(seed, mod, b, a)
    ///     let zero = maskA.add(maskB, mod)
    ///     value.add(zero, mod) == value
    ///
    /// holds (meaning x is a representation of 0 / masks cancel each other out). This is curtial to SecureAggregation.
    ///
    /// - Important: Ciritical for Security of the protocol
    ///
    static func mask(forSeed seed: SharedSecret, mod: Modulus, ownID: UserID, otherID: UserID) -> Self
}
