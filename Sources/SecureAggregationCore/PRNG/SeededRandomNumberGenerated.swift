//
//  File.swift
//  
//
//  Created by stephan on 02.09.21.
//

import Foundation
import CryptoKit

//typealias PRGSeed = Int
//
//protocol SAPRG {
//    init(_ sharedSecret: SharedSecret)
//    func mask() -> ValueType
//}
//
//struct IntSAPRG: SAPRG {
//    let sharedSecret: SharedSecret
//    init(_ sharedSecret: SharedSecret) {
//        self.sharedSecret = sharedSecret
//    }
//    
//    func mask() -> ValueType {
//        sharedSecret.hashValue
//    }
//}

///// Seedable random number generator
/////
///// Uses drand48() to generate random numbers; srand48(_:) to set the seed.
/////
///// - copyright: https://www.advancedswift.com/swift-random-numbers/#swift-random-seed
//struct SeededPseudorandomGenerator: RandomNumberGenerator {
//    init(seed: PRGSeed) {
//        srand48(seed)
//    }
//
//    func next() -> UInt64 {
//        return withUnsafeBytes(of: drand48()) { bytes in
//            bytes.load(as: UInt64.self)
//        }
//    }
//}
