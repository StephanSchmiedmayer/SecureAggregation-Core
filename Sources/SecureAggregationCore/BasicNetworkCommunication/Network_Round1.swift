//
//  File.swift
//  
//
//  Created by stephan on 15.09.21.
//

import Foundation

extension Network {
    public struct Round1 {
        fileprivate init() {}
        
        public struct ClientData: ModelWrapper, SANetworkMessage {
            public typealias WrappedModel = Model.Round1.ClientData
            
            public let encryptedShares: [Network.EncryptedShare]

            public init(_ wrappedModel: Model.Round1.ClientData) throws {
                self.encryptedShares = try wrappedModel.encryptedShares.map { try Network.EncryptedShare($0) }
            }
            
            public func unwrap() throws -> Model.Round1.ClientData {
                return Model.Round1.ClientData(encryptedShares: try self.encryptedShares.map { try $0.unwrap() })
            }
        }
        
        public struct ServerData: ModelWrapper, SANetworkMessage {
            public typealias WrappedModel = Model.Round1.ServerData
            
            public let encryptedServerMessagesForMe: [Network.EncryptedShare]
            
            public init(_ wrappedModel: Model.Round1.ServerData) throws {
                self.encryptedServerMessagesForMe = try wrappedModel.encryptedServerMessagesForMe.wrap()
            }
            
            public func unwrap() throws -> Model.Round1.ServerData {
                return Model.Round1.ServerData(encryptedServerMessagesForMe: try encryptedServerMessagesForMe.unwrap())
            }

        }
    }
}
