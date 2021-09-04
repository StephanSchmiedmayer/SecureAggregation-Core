//
//  File.swift
//  
//
//  Created by stephan on 28.08.21.
//

import Foundation
import Vapor

public struct SetupResult<Modulus: Content>: Content, SAServerMessage {
    public let nextMessageAt: Date
    public let config: SAConfiguration<Modulus>
}
