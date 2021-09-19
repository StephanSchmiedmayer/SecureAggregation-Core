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
    /// Starts a new round of secure aggregation on the server. Only needs to be called by one client.
    case start
    
    /// Login the client with the server.
    case login
    
    /// Finish login phase on the server. Only needs to be called by one client.
    case finishLogin
    
    /// Download the setup information from the server to the client.
    case setup
    
    /// Finish setup phase on the server. Only needs to be called by one client.
    case finishSetup
    
    /// Upload Client message for round 0 to the server
    case round0ClientMessage
    
    /// Finish round0-collection phase on the server. Only needs to be called by one client.
    case finishRound0Collection
    
    /// Download server message for round 0
    case round0ServerMessage
    
    /// Finish round1 phase on the server. Only needs to be called by one client.
    case advanceToRound1
    
    /// Upload Client message for round 1 to the server
    case round1ClientMessage
    
    /// Finish round1-colleciton phase on the server. Only needs to be called by one client.
    case finishRound1Collection
    
    /// Download server message for round 1
    case round1ServerMessage
    
    /// Finish round1 phase on the server. Only needs to be called by one client.
    case advanceToRound2
    
    /// Upload Client message for round 2 to the server
    case round2ClientMessage
    
    /// Finish round2-collection phase on the server. Only needs to be called by one client.
    case finishRound2Collection
    
    /// Download server message for round 2
    case round2ServerMessage
    
    /// Finish round2 phase on the server. Only needs to be called by one client.
    case advanceToRound4
    
    /// Upload Client message for round 4 to the server
    case round4ClientMessage
    
    /// Finish round4-collection phase on the server. Only needs to be called by one client.
    case finishRound4Collection
    
    /// Download server message for round 4
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
            return restInfo(method: .post) // TODO: Eignetlich kein post, besser als URL-parameter?
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
