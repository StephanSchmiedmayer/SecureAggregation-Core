//
//  File.swift
//  
//
//  Created by stephan on 16.08.21.
//

import Vapor
extension Model {
    public struct Round2 {
        private init() {}
        
        public struct ClientData<Value: SAWrappedValue> {
            public let value: Value
            
            public init(value: Value) {
                self.value = value
            }
        }
        
        public struct ServerData {
            public let remainingUsers: [UserID]
            
            public init(remainingUsers: [UserID]) {
                self.remainingUsers = remainingUsers
            }
        }
    }
}
