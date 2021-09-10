//
//  File.swift
//  
//
//  Created by stephan on 11.09.21.
//

import Foundation

enum SecureAggregationProtocolError {
    case tThresholdUndercut
    case unexpecedUserInProtocol
    case securityViolation(description: String?)
}

enum SecureAggregationError: Error {
    case incorrectStateForMethod
    case invalidStateTransition
    case protocolAborted(reason: SecureAggregationProtocolError)
}
