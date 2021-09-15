//
//  File.swift
//  
//
//  Created by stephan on 15.08.21.
//

import Vapor

extension Model {
    public struct Round0 {
        fileprivate init() {}
                
        /// Round 0 Message from Client to Server
        ///
        /// - Important: Gets completely forwarded in `Round0.Server`
        public struct ClientData {
            public let publicKeyInformation: Model.PublicKeysOfUser
            
            public init(publicKeyInformation: Model.PublicKeysOfUser) {
                self.publicKeyInformation = publicKeyInformation
            }
        }
        
        /// Round 0 Message from Server to Client
        public struct ServerData {
            public let collectedData: [Model.PublicKeysOfUser]
            
            public init(collectedData: [Model.PublicKeysOfUser]) {
                self.collectedData = collectedData
            }
        }
    }
}
