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
public struct SAConfiguration: Content {
    public init(numberOfUsers: Int, threshold: Int, modulus: Int) {
        self.numberOfUsers = numberOfUsers
        self.threshold = threshold
        self.modulus = modulus
    }
    
    /// Number of users
    public let numberOfUsers: Int
    
    /// Threshold value
    public let threshold: Int
    
    /// ZmR
    public let modulus: Int
}
