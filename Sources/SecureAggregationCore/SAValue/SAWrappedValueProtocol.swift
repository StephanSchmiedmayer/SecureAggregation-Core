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
    static func mask(forSeed seed: SharedSecret, mod: Modulus) -> Self
}
