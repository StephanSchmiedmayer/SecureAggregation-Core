//
//  File.swift
//  
//
//  Created by stephan on 16.08.21.
//

import Foundation

extension Model {
    public struct Round4 {
        private init() {}
        
        public class ClientDataBuilder {
            private(set) var s_uv: [Model.AdressedShare]
            private(set) var b_uv: [Model.AdressedShare]
            
            public init() {
                s_uv = []
                b_uv = []
            }

            public func add_s_uv(_ share: Model.AdressedShare) {
                s_uv.append(share)
            }
            
            public func add_b_uv(_ share: Model.AdressedShare) {
                b_uv.append(share)
            }
            
            public func finish() -> Round4.ClientData {
                return Round4.ClientData(s_uv: s_uv, b_uv: b_uv)
            }
        }

        
        public struct ClientData: Codable, Equatable {
            public let s_uv: [Model.AdressedShare]
            public let b_uv: [Model.AdressedShare]
            
            public init(s_uv: [Model.AdressedShare], b_uv: [Model.AdressedShare]) {
                self.s_uv = s_uv
                self.b_uv = b_uv
            }
        }
        
        public struct ServerData<Value: SAWrappedValue>: Codable, Equatable {
            public let value: Value
            
            public init(value: Value) {
                self.value = value
            }
        }
    }
}
