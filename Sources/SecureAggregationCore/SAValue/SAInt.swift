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
        
    public init(_ value: Value, mod: Modulus) {
        let modValue = value % mod
        self.value = modValue + (modValue < 0 ? mod : 0)
    }

    public func add(_ rhs: SAInt, mod: Int) -> SAInt {
        SAInt((value + rhs.value), mod: mod)
    }
    
    public func sub(_ rhs: SAInt, mod: Int) -> SAInt {
        SAInt((value + rhs.value), mod: mod)
    }
    
    static public var zero: SAInt {
        SAInt(0, mod: 1)
    }
    
    public func cancelling(ownID: UserID, otherID: UserID, mod: Modulus) -> SAInt {
        guard ownID != otherID else {
            return SAInt(0, mod: mod)
        }
        return SAInt(value * (ownID < otherID ? 1 : -1), mod: mod)
    }
    
    public static func mask(forSeed seed: SharedSecret, mod: Int) -> SAInt {
        SAInt(seed.hashValue, mod: mod)
    }
    
    public var description: String {
        "\(value)"
    }
}
