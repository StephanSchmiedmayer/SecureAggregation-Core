//
//  File.swift
//  
//
//  Created by stephan on 02.09.21.
//

import Foundation
import CryptoKit

public struct SAInt: SAWrappedValue {
    
    public typealias Value = Int
    public typealias Modulus = Int
    
    let value: Value
    
    public init(_ value: Value) {
        self.value = value
    }

    public func add(_ rhs: SAInt, mod: Int) -> SAInt {
        SAInt((value + rhs.value) % mod)
    }
    
    public func sub(_ rhs: SAInt, mod: Int) -> SAInt {
        SAInt((value + rhs.value) % mod)
    }
    
    public func cancelling(ownID: UserID, otherID: UserID) -> SAInt {
        guard ownID != otherID else {
            return SAInt(0)
        }
        return SAInt(value * (ownID < otherID ? 1 : -1))
    }
    
    public static func mask(forSeed seed: SharedSecret, mod: Int) -> SAInt {
        SAInt(seed.hashValue % mod)
    }
}
