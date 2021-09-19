//
//  SANetworkMessage.swift
//  shoppingList
//
//  Created by stephan on 19.09.21.
//

import Foundation
import Vapor

/// Protocol indicating that the conforming struct is intended to be sent over the network as is.
///
/// Use as a parameter to generic networking functions.
/// "Top level struct sent over the network"
public protocol SANetworkMessage: Content {
    
}

extension SANetworkMessage {
    public func encode() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
