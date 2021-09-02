//
//  File.swift
//  
//
//  Created by stephan on 28.08.21.
//

import Foundation

/// Minimum information needed in a Secure Aggregation message from the server to the client
protocol SAServerMessage {
    var nextMessageAt: Date { get }
}

/// Minimum informatino needed in a Secure Aggregation message from the client to the server
protocol SAClientMessage {
    var userID: UserID { get }
}
