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
        
        /// Public keys of the user with `UserID` `userID`
        public struct PublicKeysOfUser {
            /// User who ones the private keys corresponding to the public keys
            public let userID: UserID
            public let c_publicKey: SAPubKeyCurve.KeyAgreement.PublicKey
            public let s_publicKey: SAPubKeyCurve.KeyAgreement.PublicKey
            
            public init(userID: UserID,
                        c_publicKey: SAPubKeyCurve.KeyAgreement.PublicKey,
                        s_publicKey: SAPubKeyCurve.KeyAgreement.PublicKey) {
                self.userID = userID
                self.c_publicKey = c_publicKey
                self.s_publicKey = s_publicKey
            }
        }
        
        /// Round 0 Message from Client to Server
        ///
        /// - Important: Gets completely forwarded in `Round0.Server`
        public struct ClientData {
            public let publicKeyInformation: PublicKeysOfUser
            
            public init(publicKeyInformation: PublicKeysOfUser) {
                self.publicKeyInformation = publicKeyInformation
            }
        }
        
        /// Round 0 Message from Server to Client
        public struct ServerData {
            public let collectedData: [PublicKeysOfUser]
            
            public init(collectedData: [PublicKeysOfUser]) {
                self.collectedData = collectedData
            }
        }
    }
}
