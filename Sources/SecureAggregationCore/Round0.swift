//
//  File.swift
//  
//
//  Created by stephan on 15.08.21.
//

import Vapor

public struct Round0 {
    private init() {}
    
    public struct Client: Content, Hashable {
        public let id: Int
    }
    
    public struct Server: Content {
        
    }
}
