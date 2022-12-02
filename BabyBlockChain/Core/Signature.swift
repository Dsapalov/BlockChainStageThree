//
//  Signature.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol SignatureProtocol {
    static func signData(priv: PrivateKey, message: String) -> Data
    static func verifySignature(realSig: Data, message: String, publicKey: PublicKey) -> Bool
    static func printSignature(signature: Signature)
}

final class Signature {
    
}

extension Signature: SignatureProtocol {
    static func signData(priv: PrivateKey, message: String) -> Data {
        return Data()
    }
    
    static func verifySignature(realSig: Data, message: String, publicKey: PublicKey) -> Bool {
        return false
    }
    
    static func printSignature(signature: Signature) {
        
    }
    
    
}
