//
//  File.swift
//  
//
//  Created by stephan on 15.09.21.
//

import Foundation
import Vapor

extension Network {
    public struct Round0 {
        fileprivate init() {}
        
        public struct ClientData: ModelWrapper {
            public typealias WrappedModel = Model.Round0.ClientData
            
            public let publicKeyInformation: Network.PublicKeysOfUser

            public init(_ wrappedModel: Model.Round0.ClientData) {
                self.publicKeyInformation = Network.PublicKeysOfUser(wrappedModel.publicKeyInformation)
            }
            
            public func unwrap() throws -> Model.Round0.ClientData {
                return Model.Round0.ClientData(publicKeyInformation: try publicKeyInformation.unwrap())
            }
        }
        
        public struct ServerData: ModelWrapper {
            public typealias WrappedModel = Model.Round0.ServerData
            
            public let collectedData: [Network.PublicKeysOfUser]
            
            public init(_ wrappedModel: Model.Round0.ServerData) {
                self.collectedData = wrappedModel.collectedData.map { Network.PublicKeysOfUser($0) }
            }
            
            public func unwrap() throws -> Model.Round0.ServerData {
                return Model.Round0.ServerData(collectedData: try collectedData.unwrap())
            }
        }
    }
}
