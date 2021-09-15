//
//  File.swift
//  
//
//  Created by stephan on 11.09.21.
//

import Foundation

public enum SecureAggregationProtocolError {
    case tThresholdUndercut
    case unexpecedUserInProtocol
    case securityViolation(description: String?)
}

public enum SecureAggregationError: Error {
    case incorrectStateForMethod
    case invalidStateTransition
    case protocolAborted(reason: SecureAggregationProtocolError)
}

public enum SecureAggregationNetworkError: Error {
    case decodingError
    case cryptographicError
}
