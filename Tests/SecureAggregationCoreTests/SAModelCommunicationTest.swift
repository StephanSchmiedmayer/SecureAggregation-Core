//
//  File.swift
//  
//
//  Created by stephan on 05.10.21.
//

import Foundation
import XCTest
@testable import SecureAggregationCore

/// Tests the ModelCommunication (everything inside the`Model` namespace)
///
/// Only tests any structs that are not just plain containers.
/// Plain containers can assure correctnes by code-review because of simplicity
final class SAModelCommunicationTest: XCTestCase {
    func testRound4ClientDataBuilderEmpty() {
        let clientData = Model.Round4.ClientDataBuilder().finish()
        XCTAssertEqual(clientData.b_uv, [])
        XCTAssertEqual(clientData.s_uv, [])
    }
    // TODO: Round4ClientDataBuilder with some actual data
//    func testRound4ClientDataBuilder() {
//        let dataBuilder = Model.Round4.ClientDataBuilder()
//        dataBuilder.add_b_uv(Model.AdressedShare(origin: 0, destination: 1, share: Secret(data: Data(), threshold: 10, shares: 10)))
//    }
}
