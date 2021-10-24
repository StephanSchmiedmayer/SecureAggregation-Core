//
//  File.swift
//  
//
//  Created by stephan on 21.09.21.
//

import XCTest
import CryptoKit
@testable import SecureAggregationCore

// Test your custom SAWrappedValues here with `SAWrappedValueTest`
// Make sure SAWrappedValue conforms to TestableSAWrappedValue (e.g. via fileprivate extension)

extension SAInt: TestableSAWrappedValue {
    public static func == (lhs: SAInt, rhs: SAInt) -> Bool {
        lhs.value == rhs.value
    }
}

class SAIntTest: SecureAggregationWrappedValueTests<SAInt> {
    func testInitialization() {
        XCTAssertEqual(SAInt(11, mod: 10), SAInt(1, mod: 10))
        XCTAssertEqual(SAInt(10, mod: 10), SAInt(0, mod: 10))
        XCTAssertEqual(SAInt(-1, mod: 10), SAInt(9, mod: 10))
        XCTAssertEqual(SAInt(-11, mod: 10), SAInt(9, mod: 10))
    }
    
    func testAddition() {
        XCTAssertEqual(SAInt(1, mod: 10).add(SAInt(9, mod: 10), mod: 10), SAInt(0, mod: 10))
        XCTAssertEqual(SAInt(2, mod: 10).add(SAInt(7, mod: 10), mod: 10), SAInt(9, mod: 10))
        XCTAssertEqual(SAInt(0, mod: 10).add(SAInt(1, mod: 10), mod: 10), SAInt(1, mod: 10))
        XCTAssertEqual(SAInt(9, mod: 10).add(SAInt(9, mod: 10), mod: 10), SAInt(8, mod: 10))
    }
    
    func testSubtraction() {
        XCTAssertEqual(SAInt(9, mod: 10).sub(SAInt(1, mod: 10), mod: 10), SAInt(8, mod: 10))
        XCTAssertEqual(SAInt(9, mod: 10).sub(SAInt(5, mod: 10), mod: 10), SAInt(4, mod: 10))
        XCTAssertEqual(SAInt(3, mod: 10).sub(SAInt(5, mod: 10), mod: 10), SAInt(8, mod: 10))
        XCTAssertEqual(SAInt(0, mod: 10).sub(SAInt(1, mod: 10), mod: 10), SAInt(9, mod: 10))
    }
    
    func testMask() throws {
        let privateKey1 = try SAPubKeyCurve.KeyAgreement.PrivateKey(
            rawRepresentation: Data(base64Encoded: "YEblYMhb6OZt/CKZiVhRPwW838OlUDsAskuc47VaTkE=")!)
        let privateKey2 = try SAPubKeyCurve.KeyAgreement.PrivateKey(
            rawRepresentation: Data(base64Encoded: "cHUpjK24Hq0UTtYW/MsocFHZtMfJKoYPbO0JvPJWmXU=")!)

//        let privateKey1 = SAPubKeyCurve.KeyAgreement.PrivateKey()
//        let privateKey2 = SAPubKeyCurve.KeyAgreement.PrivateKey()
//        print(privateKey1.rawRepresentation.base64EncodedString())
//        print(privateKey2.rawRepresentation.base64EncodedString())

        let sharedSecret = try privateKey1.sharedSecretFromKeyAgreement(with: privateKey2.publicKey)
//        let symmetricKey = sharedSecret.hkdfDerivedSymmetricKey(
//            using: SA_HKDF_HashFunction.self,
//            salt: "LeagueOfLegends".data(using: .utf8)!,
//            sharedInfo: Data(),
//            outputByteCount: SASymmetricCipherKeyByteCount)
        
//        let nonce = try SASymmetricCipher.Nonce(data: Data(hex: "671ba851014f2a303d69d4c9")!)
        
        let mask = try SAInt.mask(sharedSecret: sharedSecret, salt: "LeagueOfLegends".data(using: .utf8)!, mod: 1000000)
        print(mask)
    }
    
    func testPRG(forKey key: SymmetricKey, mod: Int) throws {
        var value = 0
        let nonce = try SASymmetricCipher.Nonce(data: Data(hex: "671ba851014f2a303d69d4c9")!)
        print(nonce.hex)
        let encryptedZero = try SASymmetricCipher.seal(
            Data(bytes: &value,
                 count: MemoryLayout.size(ofValue: value)),
            using: key,
            nonce: nonce)
        let data = encryptedZero.ciphertext
        let x = data.withUnsafeBytes { bytes in
            bytes.load(as: Int32.self)
        }
        print(x)
    }
}
