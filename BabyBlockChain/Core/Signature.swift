//
//  Signature.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol SignatureProtocol {
    func signData(publicKey: PublicKey, message: String) -> Data?
    func verifySignature(realSig: Data, message: String, priv: PrivateKey) -> Bool
}

final class Signature {
    
}

extension Signature: SignatureProtocol {
    
    func signData(publicKey: PublicKey, message: String) -> Data? {
        let messageData = message.data(using: .utf8)!
        guard let cipheredData = SecKeyCreateEncryptedData(publicKey,
                                                         .rsaEncryptionOAEPSHA512,
                                                           messageData as CFData,
                                                         nil) as Data? else {
            return nil
        }
        
        return cipheredData
    }
    
    func verifySignature(realSig: Data, message: String, priv: PrivateKey) -> Bool {
        
        guard let clearTextData = SecKeyCreateDecryptedData(priv,
                                                            .rsaEncryptionOAEPSHA512,
                                                            realSig as CFData,
                                                            nil) as Data? else {
            return false
        }

        guard let resultText = String(data: clearTextData, encoding: .utf8) else { return false }
        
        return message == resultText
    }
    
}
