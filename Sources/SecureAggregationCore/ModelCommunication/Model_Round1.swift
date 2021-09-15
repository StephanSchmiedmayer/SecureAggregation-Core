//
//  File.swift
//  
//
//  Created by stephan on 15.08.21.
//

import Vapor
extension Model {
    public struct Round1 {
        
        fileprivate init() {}
        
        /// Round 1 message from Client to Server
        public struct ClientData {
            public let encryptedShares: [Model.EncryptedShare]
            
            public init(encryptedShares: [Model.EncryptedShare]) {
                self.encryptedShares = encryptedShares
            }
        }
        
        public struct ServerData {
            public let encryptedServerMessagesForMe: [Model.EncryptedShare]
            
            public init(encryptedServerMessagesForMe: [Model.EncryptedShare]) {
                self.encryptedServerMessagesForMe = encryptedServerMessagesForMe
            }
        }
    }
}
