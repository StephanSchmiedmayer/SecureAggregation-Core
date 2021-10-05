//
//  File.swift
//  
//
//  Created by stephan on 05.10.21.
//

import Foundation
import CryptoKit

extension SAPubKeyCurve.KeyAgreement.PublicKey: Equatable {
    public static func == (lhs: SAPubKeyCurve.KeyAgreement.PublicKey, rhs: SAPubKeyCurve.KeyAgreement.PublicKey) -> Bool {
        lhs.rawRepresentation == rhs.rawRepresentation
    }
}

extension SASymmetricCipher.SealedBox: Equatable {
    public static func == (lhs: AES.GCM.SealedBox, rhs: AES.GCM.SealedBox) -> Bool {
        lhs.combined == rhs.combined
    }
}
