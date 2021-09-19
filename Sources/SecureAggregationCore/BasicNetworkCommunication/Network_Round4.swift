//
//  File.swift
//  
//
//  Created by stephan on 15.09.21.
//

import Foundation

extension Network {
    public struct Round4 {
        fileprivate init() {}
        
        public struct ClientData<Value: SAWrappedValue>: ModelWrapper, SANetworkMessage {
            public typealias WrappedModel = Model.Round4.ClientData
            
            public let wrappedValue: Model.Round4.ClientData

            public init(_ wrappedModel: Model.Round4.ClientData) {
                self.wrappedValue = wrappedModel
            }
            
            public func unwrap() -> Model.Round4.ClientData {
                return wrappedValue
            }
        }
        
        public struct ServerData<Value: SAWrappedValue>: ModelWrapper, SANetworkMessage {
            public typealias WrappedModel = Model.Round4.ServerData<Value>
            
            public let wrappedValue: Model.Round4.ServerData<Value>
            
            public init(_ wrappedModel: Model.Round4.ServerData<Value>) {
                self.wrappedValue = wrappedModel
            }
            
            public func unwrap() -> Model.Round4.ServerData<Value> {
                return wrappedValue
            }
        }
    }
}
