//
//  File.swift
//  
//
//  Created by stephan on 02.09.21.
//

import Foundation

public struct SAInt: SAWrappedValue {
    
    typealias Value = Int
    typealias Modulus = Int
    
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
    
    public func mask(forSeed seed: SharedSecret, mod: Int) -> SAInt {
        SAInt(seed.hashValue % mod)
    }
    
    
    
}
