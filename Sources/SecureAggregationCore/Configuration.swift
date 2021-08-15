//
//  Configuration.swift
//  shoppingList
//
//  Created by stephan on 13.08.21.
//

import Foundation
import CryptoKit

@available(macOS 10.15, *)
public struct Configuration: Codable {
    /// Number of users
    let numberOfUsers: Int
    
    /// Threshold value
    let threshold: Int
    
    /// ZmR
    let modulus: Int
}
