//
//  File.swift
//  
//
//  Created by stephan on 15.09.21.
//

import Foundation

extension Network {
    public struct Round2 {
        fileprivate init() {}
        
        public struct ClientData<Value: SAWrappedValue>: ModelWrapper, SANetworkMessage {
            public typealias WrappedModel = Model.Round2.ClientData<Value>
            
            public let wrappedValue: Model.Round2.ClientData<Value>

            public init(_ wrappedModel: Model.Round2.ClientData<Value>) {
                self.wrappedValue = wrappedModel
            }
            
            public func unwrap() -> Model.Round2.ClientData<Value> {
                return wrappedValue
            }
        }
        
        public struct ServerData: ModelWrapper, SANetworkMessage {
            public typealias WrappedModel = Model.Round2.ServerData
            
            public let wrappedValue: Model.Round2.ServerData
            
            public init(_ wrappedModel: Model.Round2.ServerData) {
                self.wrappedValue = wrappedModel
            }
            
            public func unwrap() -> Model.Round2.ServerData {
                return wrappedValue
            }
        }
    }
}
