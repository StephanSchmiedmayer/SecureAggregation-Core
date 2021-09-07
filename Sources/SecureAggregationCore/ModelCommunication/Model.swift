//
//  File.swift
//  
//
//  Created by stephan on 07.09.21.
//

import Foundation
import ShamirSecretShare

public struct Model {
    fileprivate init() {}
    
    /// Encrypted share from user `u` to user `v`
    public struct EncryptedShare {
        /// Encrypted shares (`EncryptedRound1ClientDataWrapper`)
        public let e_uv: SASymmetricCipher.SealedBox
        /// User that encrypted the shares
        public let u: UserID
        /// Destination for the encrypted shares
        public let v: UserID
        
        public init(e_uv: SASymmetricCipher.SealedBox, u: UserID, v: UserID) {
            self.e_uv = e_uv
            self.u = u
            self.v = v
        }
    }
    
    public struct SharesWrapper: Codable {
        public let u: UserID
        public let v: UserID
        public let s_uv_privateKeyShare: Secret.Share
        public let b_uv_Share: Secret.Share
        
        public init(u: UserID, v: UserID, s_uv_privateKeyShare: Secret.Share, b_uv_Share: Secret.Share) {
            self.u = u
            self.v = v
            self.s_uv_privateKeyShare = s_uv_privateKeyShare
            self.b_uv_Share = b_uv_Share
        }
    }
    
    public struct AdressedShare: Codable {
        public let origin: UserID
        public let destination: UserID
        public let share: Secret.Share
        
        public init(origin: UserID, destination: UserID, share: Secret.Share) {
            self.origin = origin
            self.destination = destination
            self.share = share
        }
    }
}
