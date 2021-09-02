//
//  File.swift
//  
//
//  Created by stephan on 15.08.21.
//

import Vapor

public struct Round0 {
    private init() {}
    
    /// Round 0 Message from Client to Server
    ///
    /// - Important: Gets completely forwarded in `Round0.Server`
    public struct Client: Content, SAClientMessage {
        public let userID: UserID
        public let c_u_PK: Data
        public let s_u_PK: Data
                
        init(userID: UserID, c_u_PK: SAPubKeyCurve.KeyAgreement.PublicKey, s_u_PK: SAPubKeyCurve.KeyAgreement.PublicKey) {
            self.userID = userID
            self.c_u_PK = c_u_PK.rawRepresentation
            self.s_u_PK = s_u_PK.rawRepresentation
        }
    }
    
    /// Round 0 Message from Server to Client
    public struct Server: Content {
        public let clientMessage: [Round0.Client]
    }
}
