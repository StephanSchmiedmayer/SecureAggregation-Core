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
        
        public struct ClientData<Value: SAWrappedValue>: ModelWrapper {
            public typealias WrappedModel = Model.Round2.ClientData<Value>
            
            public let wrappedValue: Model.Round2.ClientData<Value>

            public init(_ wrappedModel: Model.Round2.ClientData<Value>) throws {
                self.wrappedValue = wrappedModel
            }
            
            public func unwrap() throws -> Model.Round2.ClientData<Value> {
                return wrappedValue
            }
        }
        
        public struct ServerData: ModelWrapper {
            public typealias WrappedModel = Model.Round2.ServerData
            
            public let wrappedValue: Model.Round2.ServerData
            
            public init(_ wrappedModel: Model.Round2.ServerData) throws {
                self.wrappedValue = wrappedModel
            }
            
            public func unwrap() throws -> Model.Round2.ServerData {
                return wrappedValue
            }
        }
    }
}
