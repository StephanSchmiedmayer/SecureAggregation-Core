//
//  File.swift
//  
//
//  Created by stephan on 16.08.21.
//

import Vapor

public struct Round4 {
    private init() {}
    
    public struct Client: Content, Hashable {
        public let id: Int
    }
    
    public struct Server: Content {
        
    }
}
