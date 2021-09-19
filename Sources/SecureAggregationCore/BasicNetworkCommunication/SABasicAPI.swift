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
public enum SAHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public struct SARESTInfo {
    /// The part of the URL thats shared between all endpoints of this API
    public let commonBaseURL: String = "SecureAggregation"
    
    /// The differentiating (end-) part of the URL
    public let differentiatingRelativeURL: String
    
    /// URL relative to the base URL of the server / URL of this API e.g. `http://127.0.0.1:8080/<fullRelativeURL>`
    public var fullRelativeURL: String {
        commonBaseURL + "/" + differentiatingRelativeURL
    }
    
    /// REST method
    public let method: SAHTTPMethod
    
    init(differentiatingRelativeURL: String, method: SAHTTPMethod) {
        self.differentiatingRelativeURL = differentiatingRelativeURL
        self.method = method
    }
}

/// Definition of the basic (REST) API for the BasicSecureAggregationController
///
/// Raw value represents the URL relative to the base URL of the server / URL of this API
public enum SABasicAPI: String, CaseIterable {
    case reset
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
        case .reset:
            return restInfo(method: .post)
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
    
    var basePath: String {
        "SecureAggregation"
    }
    
    /// Convenience method using the raw value of self as the relativeURL of RESTInfo
    private func restInfo(method: SAHTTPMethod) -> SARESTInfo {
        return SARESTInfo(differentiatingRelativeURL: self.rawValue, method: method)
    }
}
