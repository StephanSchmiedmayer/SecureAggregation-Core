//
//  File.swift
//  
//
//  Created by stephan on 16.09.21.
//

import Foundation

/// All rest api methods used in the API
///
/// Raw value = HTTPMethod String
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public struct SARESTInfo {
    /// URL relative to the base URL of the server / URL of this API
    public let relativeURL: String
    
    /// REST method
    public let method: HTTPMethod
}

/// Definition of the basic (REST) API for the BasicSecureAggregationController
///
/// Raw value represents the URL relative to the base URL of the server / URL of this API
public enum SABasicAPI: String, CaseIterable {
    case start
    case login
    case finishLogin
    case setup
    case finishSetup
    case round0ClientMessage
    case finishRound0Collection
    case round0ServerMessage
    case advanceToRound1
    case round1ClientMessage
    case finishRound1Collection
    case round1ServerMessage
    case advanceToRound2
    case round2ClientMessage
    case finishRound2Collection
    case round2ServerMessage
    case advanceToRound4
    case round4ClientMessage
    case finishRound4Collection
    case round4ServerMessage
    
    public var info: SARESTInfo {
        switch self {
        case .start:
            return restInfo(method: .post)
        case .login:
            return restInfo(method: .post)
        case .finishLogin:
            return restInfo(method: .post)
        case .setup:
            return restInfo(method: .get)
        case .finishSetup:
            return restInfo(method: .post)
        case .round0ClientMessage:
            return restInfo(method: .post)
        case .finishRound0Collection:
            return restInfo(method: .post)
        case .round0ServerMessage:
            return restInfo(method: .post)
        case .advanceToRound1:
            return restInfo(method: .post)
        case .round1ClientMessage:
            return restInfo(method: .post)
        case .finishRound1Collection:
            return restInfo(method: .post)
        case .round1ServerMessage:
            return restInfo(method: .get)
        case .advanceToRound2:
            return restInfo(method: .post)
        case .round2ClientMessage:
            return restInfo(method: .post)
        case .finishRound2Collection:
            return restInfo(method: .post)
        case .round2ServerMessage:
            return restInfo(method: .get)
        case .advanceToRound4:
            return restInfo(method: .post)
        case .round4ClientMessage:
            return restInfo(method: .post)
        case .finishRound4Collection:
            return restInfo(method: .post)
        case .round4ServerMessage:
            return restInfo(method: .get)
        }
    }
    
    /// Convenience method using the raw value of self as the relativeURL of RESTInfo
    private func restInfo(method: HTTPMethod) -> SARESTInfo {
        return SARESTInfo(relativeURL: self.rawValue, method: method)
    }
}
