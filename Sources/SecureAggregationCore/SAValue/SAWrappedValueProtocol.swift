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
public protocol SAWrappedValue: Content, Equatable {
    /// Valuetype that gets wrapped
    associatedtype Value: Content
    /// Value of the modulus defined for the type
    associatedtype Modulus: Content
    
    /// Initializes self with the value. Applies the modulus if necessary. Does not store the modulus
    init(_ value: Value, mod: Modulus)
        
    // MARK: - arithmetic operations
    // TODO: real arithmetic description
    
    /// Modulo addition of `self` with `rhs` modulo `mod`
    ///
    /// Following properties must hold for addition:
    /// - Associativity
    /// - Commutativity
    func add(_ rhs: Self, mod: Modulus) -> Self
    
    /// Modulo subtraction of `rhs` from `self` modulo `mod` (`self` - `rhs` mod `mod`)
    ///
    /// Following properties must hold for addition:
    /// - Associativity
    /// - Commutativity
    func sub(_ rhs: Self, mod: Modulus) -> Self
    
    /// Representation of Zero. Must be a neutral element
    static var zero: Self { get }
    
    // MARK: - cryptographic operations
    
    /// Creates a new `Self` that canceles out with switched userIDs
    ///
    /// Needs ot take into account ownID and otherID so that for any valid  `seed`, `mod`, `a`, `b`:
    ///
    ///     let mask = mask(seed, mod)
    ///     let maskA = mask.cancelling(ownID: a, otherID: b, mod: mod)
    ///     let maskB = mask.cancelling(ownID: b, otherID: a, mod: mod)
    ///     let zero = maskA.add(maskB, mod)
    ///     value.add(zero, mod) == value
    ///
    /// holds (meaning zero is a representation of 0 / masks cancel each other out). This is curtial to SecureAggregation.
    func cancelling(ownID: UserID, otherID: UserID, mod: Modulus) -> Self
    
    /// Creates a mask from a seed
    ///
    /// - Important: Ciritical for Security of the protocol
    static func mask(forKey key: SymmetricKey, mod: Modulus) throws -> Self
    // TODO: Add nonce for true PRG, share Nonce with public keys
//    static func mask(forKey key: SymmetricKey, mod: Modulus, nonce: SASymmetricCipher.Nonce) throws -> Self

    
    var description: String { get }
}
