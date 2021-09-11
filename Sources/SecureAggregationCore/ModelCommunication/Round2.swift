//
//  File.swift
//  
//
//  Created by stephan on 16.08.21.
//

import Vapor
extension Model {
    public struct MaskedValueFromUser<Value: SAWrappedValue> {
        public let maskedValue: Value
        public let origin: UserID
        
        public init(maskedValue: Value, origin: UserID) {
            self.maskedValue = maskedValue
            self.origin = origin
        }
    }
    
    public struct Round2 {
        private init() {}
        
        public struct ClientData<Value: SAWrappedValue> {
            public let wrappedValue: MaskedValueFromUser<Value>
            
            public init(wrappedValue: MaskedValueFromUser<Value>) {
                self.wrappedValue = wrappedValue
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
