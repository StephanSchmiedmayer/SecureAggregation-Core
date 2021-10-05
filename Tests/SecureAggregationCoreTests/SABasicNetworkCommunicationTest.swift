//
//  File.swift
//  
//
//  Created by stephan on 05.10.21.
//

import Foundation
import XCTest
@testable import SecureAggregationCore

/// Tests the SABasicNetworkCommunication
///
/// Uses random testing to generate input values.
///
/// Only test structs that are more than just plain containers e.g. by doing some en-/decoding. 
/// Plain containers can assure correctnes by code-review because of simplicity
final class SABasicNetworkCommunicationTest: XCTestCase {
    /// The amount each random test is repeated
    let repitions = 100
    
    func withRepetitions(_ function: () -> ()) {
        for _ in 0 ..< repitions {
            function()
        }
    }
    
    func testRound0ClientData() {
        withRepetitions {
            SAModelWrapperTest<Network.Round0.ClientData>.testReversability(
                Model.Round0.ClientData(publicKeyInformation: randomPublicKeysOfUser()))
        }
    }
    
    // TODO: really random testing?
    // TODO: EncryptedShare, PublicKeysOfUser, Round0, Round1
    
    // MARK: - Generator
    
    func publicKeyOfUserGenerator(count: Int) -> [Model.PublicKeysOfUser] {
        [0..<count].map { _ in
            randomPublicKeysOfUser()
        }
    }
    
    // MARK: - Helper
    
    func randomPublicKeysOfUser() -> Model.PublicKeysOfUser {
        Model.PublicKeysOfUser(
            userID: Int.random(),
            c_publicKey: SAPubKeyCurve.KeyAgreement.PrivateKey().publicKey,
            s_publicKey: SAPubKeyCurve.KeyAgreement.PrivateKey().publicKey)
    }
}

final class SAModelWrapperTest<MW: ModelWrapper> {
    /// Tests whether wraping and unwarping the model in a WrappedModel reproduces the initial model
    ///
    /// Assumes that `model` can be wrapped and unwraped without throwing an error
    static func testReversability(_ model: MW.WrappedModel) where MW.WrappedModel: Equatable {
        XCTAssertEqual(model, try MW(model).unwrap(), """
            model != ModelWrapper(model).unwrap():
            model: \(model)
            """)
    }
}
