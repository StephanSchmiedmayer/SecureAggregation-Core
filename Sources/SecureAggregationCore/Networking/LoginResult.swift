//
//  File.swift
//  
//
//  Created by stephan on 15.08.21.
//

import Vapor

public struct LoginResult: Content, SAServerMessage {
    public let userID: UserID
    public let nextMessageAt: Date
    
    
    public init(userID: UserID, nextMessageAt: Date) {
        self.userID = userID
        self.nextMessageAt = nextMessageAt
    }
}
