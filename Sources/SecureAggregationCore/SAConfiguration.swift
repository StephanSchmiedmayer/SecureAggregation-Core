//
//  Configuration.swift
//  shoppingList
//
//  Created by stephan on 13.08.21.
//

import Foundation
import CryptoKit

@available(macOS 10.15, *)
public struct SAConfiguration: Codable {
    /// Security parameter
    let k: Int
    
    /// Number of users
    let n: Int
    
    /// Threshold value
    let t: Int
    
    /// ZmR
    let r: Int
}
