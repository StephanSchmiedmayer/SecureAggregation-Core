//
//  File.swift
//  
//
//  Created by stephan on 20.08.21.
//

import Foundation
import CryptoKit

// MARK: - Security parameters
public typealias SAPubKeyCurve = Curve25519
public typealias SA_HKDF_HashFunction = SHA256
public typealias SASymmetricCipher = AES.GCM
public let SASymmetricCipherKeyBitCount = 256

// MARK: - Other
public typealias UserID = Int
/// Type of the value aggregated
///
/// Needs to be replaced with a generic protocol etc.
public typealias ValueType = Int
