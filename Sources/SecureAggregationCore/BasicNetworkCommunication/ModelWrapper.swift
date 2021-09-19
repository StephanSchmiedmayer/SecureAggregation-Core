//
//  File.swift
//  
//
//  Created by stephan on 15.09.21.
//

import Foundation
import Vapor

/// Protocol for any `Network.` struct that wrapps a `Model.` struct for transfer over the network
public protocol ModelWrapper: Content {
    associatedtype WrappedModel
    
    init(_ wrappedModel: WrappedModel) throws
    
    func unwrap() throws -> WrappedModel
}

extension ModelWrapper {
    public func encode() throws -> Data {
        try JSONEncoder().encode(self)
    }
}

extension Array where Element: ModelWrapper {
    /// Unwrapps all Elements according to `ModelWrapper.unwrap()`
    ///
    /// Dont use this method if the underlying `unwrap()` funciton does not throw. Use
    ///
    ///     .map{ $0.unwrap()}
    ///
    /// instead to avoid unnecessary error handling upstream.
    func unwrap() throws -> [Element.WrappedModel] {
        try self.map { try $0.unwrap() }
    }
}

extension Array {
    /// Wrapps all Elements according to `ModelWrapper.init(_:)`
    ///
    /// Don't use this method if the underlying `init(_:)` does not throw. Use
    ///
    ///     .map { Wrapper($0) }
    ///
    /// instead to avoid unnecessary error handling upstream.
    func wrap<Wrapper: ModelWrapper>() throws -> [Wrapper] where Element == Wrapper.WrappedModel {
        try self.map { try Wrapper($0) }
    }
}
