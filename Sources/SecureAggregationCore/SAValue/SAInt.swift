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
        SAInt((value - rhs.value), mod: mod)
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
    
//    public static func mask(forKey key: SymmetricKey, mod: Int, nonce: SASymmetricCipher.Nonce = .init()) throws -> SAInt {
    public static func mask(forKey key: SymmetricKey, mod: Int) throws -> SAInt {
        let internalNonce = try SASymmetricCipher.Nonce(data: Data(hex: "671ba851014f2a303d69d4c9")!)
        var value = Int64()
        let encryptedZero = try SASymmetricCipher.seal(
            Data(bytes: &value,
                 count: MemoryLayout.size(ofValue: value)),
            using: key,
            nonce: internalNonce)
        let PRValue = encryptedZero.ciphertext.withUnsafeBytes { bytes in
            Int(bytes.load(as: Int32.self))
        }
        return SAInt(PRValue, mod: mod)
    }
    
    public var description: String {
        "\(value)"
    }
}
