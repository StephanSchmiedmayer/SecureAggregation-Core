//
//  File.swift
//  
//
//  Created by stephan on 16.08.21.
//

import Vapor

public struct Round3 {
    private init() {}
    
    public struct Client: Content, Hashable, Equatable {
        public let id: Int
    }
    
    public struct Server: Content, Equatable {
        
    }
}
