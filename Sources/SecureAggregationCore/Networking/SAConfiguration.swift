//
//  Configuration.swift
//  shoppingList
//
//  Created by stephan on 13.08.21.
//

import Foundation
import CryptoKit
import Vapor

/// Configuration of a Secure Aggregation run
public struct SAConfiguration<Modulus: Content>: Content {
    public init(numberOfUsers: Int,
                threshold: Int,
                modulus: Modulus,
                salt: Data) {
        self.numberOfUsers = numberOfUsers
        self.threshold = threshold
        self.modulus = modulus
        self.salt = salt
    }
    // TODO: add Security parameters
    /// Number of users
    public let numberOfUsers: Int
    
    /// Threshold value
    public let threshold: Int
    
    /// ZmR
    public let modulus: Modulus
    
    /// Salt used for encryption during the Secure aggregation
    public let salt: Data
}
