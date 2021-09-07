//
//  File.swift
//  
//
//  Created by stephan on 07.09.21.
//

import Foundation

public struct Model {
    fileprivate init() {}
    
    /// Encrypted share from user `u` to user `v`
    public struct EncryptedShare {
        /// Encrypted shares (`EncryptedRound1ClientDataWrapper`)
        public var e_uv: SASymmetricCipher.SealedBox
        /// User that encrypted the shares
        public var u: UserID
        /// Destination for the encrypted shares
        public var v: UserID
        
        public init(e_uv: SASymmetricCipher.SealedBox, u: UserID, v: UserID) {
            self.e_uv = e_uv
            self.u = u
            self.v = v
        }
    }
}
