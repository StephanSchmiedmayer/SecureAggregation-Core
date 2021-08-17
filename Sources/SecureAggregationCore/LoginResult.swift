//
//  File.swift
//  
//
//  Created by stephan on 15.08.21.
//

import Vapor

public struct LoginResult: Content {
    public init(userID: Int) {
        self.userID = userID
    }
    public let userID: Int
}
