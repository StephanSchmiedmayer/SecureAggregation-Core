//
//  File.swift
//  
//
//  Created by stephan on 15.08.21.
//

import Vapor

public struct Round1 {
    private init() {}
    
    /// Round 1 message from Client to Server
    public struct Client: Content, SAClientMessage {
        public let userID: UserID
        
        
    }
    
    public struct Server: Content {
        
    }
}
