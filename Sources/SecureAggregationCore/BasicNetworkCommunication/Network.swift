//
//  File.swift
//  
//
//  Created by stephan on 14.09.21.
//

import Foundation
import Vapor

public struct Network {
    fileprivate init() {}
    
    public struct EncryptedShare: ModelWrapper {
        public typealias WrappedModel = Model.EncryptedShare
        
        public let e_uv: Data
        public let u: UserID
        public let v: UserID
        
        public init(_ modelShare: Model.EncryptedShare) throws {
            guard let e_uv_data = modelShare.e_uv.combined else {
                throw SecureAggregationNetworkError.cryptographicError
            }
            self.e_uv = e_uv_data
            self.u = modelShare.u
            self.v = modelShare.v
        }
        
        public func unwrap() throws -> Model.EncryptedShare {
            let e_uv_sealedBox = try SASymmetricCipher.SealedBox(combined: e_uv)
            return Model.EncryptedShare(e_uv: e_uv_sealedBox, u: self.u, v: self.v)
        }
    }
    
    // SharesWrapper & AdressedShare already Codable
    
    public struct SharesWrapper: ModelWrapper {
        public typealias WrappedModel = Model.SharesWrapper
        
        public let wrappedValue: Model.SharesWrapper

        public init(_ wrappedValue: Model.SharesWrapper) {
            self.wrappedValue = wrappedValue
        }
        
        public func unwrap() -> Model.SharesWrapper {
            return self.wrappedValue
        }
    }
    
    public struct AddressedShare: ModelWrapper {
        public typealias WrappedModel = Model.AdressedShare
        
        public let wrappedValue: Model.AdressedShare

        public init(_ wrappedValue: Model.AdressedShare) {
            self.wrappedValue = wrappedValue
        }
        
        public func unwrap() -> Model.AdressedShare {
            return self.wrappedValue
        }
    }
    
    public struct PublicKeysOfUser: ModelWrapper {
        public typealias WrappedModel = Model.PublicKeysOfUser
        
        public let userID: UserID
        public let c_publicKeyData: Data
        public let s_publicKeyData: Data
        
        public init(_ wrappedModel: Model.PublicKeysOfUser) {
            self.userID = wrappedModel.userID
            self.c_publicKeyData = wrappedModel.c_publicKey.rawRepresentation
            self.s_publicKeyData = wrappedModel.s_publicKey.rawRepresentation
        }
        
        public func unwrap() throws -> Model.PublicKeysOfUser {
            return try Model.PublicKeysOfUser(userID: self.userID,
                                              c_publicKey: SAPubKeyCurve.KeyAgreement.PublicKey(rawRepresentation: c_publicKeyData),
                                              s_publicKey: SAPubKeyCurve.KeyAgreement.PublicKey(rawRepresentation: s_publicKeyData))
        }
    }
    
    public struct MaskedValueFromUser<Value: SAWrappedValue>: ModelWrapper {
        public typealias WrappedModel = Model.MaskedValueFromUser<Value>
        
        public let wrappedValue: Model.MaskedValueFromUser<Value>

        public init(_ wrappedModel: Model.MaskedValueFromUser<Value>) {
            self.wrappedValue = wrappedModel
        }
        
        public func unwrap() -> Model.MaskedValueFromUser<Value> {
            return wrappedValue
        }
    }
}
