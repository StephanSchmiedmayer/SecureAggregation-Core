//
//  File.swift
//  
//
//  Created by stephan on 16.08.21.
//

import Foundation

extension Model {    
    public struct Round2 {
        private init() {}
        
        public struct ClientData<Value: SAWrappedValue>: Codable, Equatable {
            public let wrappedValue: MaskedValueFromUser<Value>
            
            public init(wrappedValue: MaskedValueFromUser<Value>) {
                self.wrappedValue = wrappedValue
            }
        }
        
        public struct ServerData: Codable, Equatable {
            public let remainingUsers: [UserID]
            
            public init(remainingUsers: [UserID]) {
                self.remainingUsers = remainingUsers
            }
        }
    }
}
