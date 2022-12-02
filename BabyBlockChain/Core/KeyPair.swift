//
//  KeyPair.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol KeyPairProtocol {
    var privateKey: SecKey? { get }
    var publicKey: SecKey? { get }
    
    func genKeyPair()
}

final class KeyPair {
    
}

extension KeyPair: KeyPairProtocol {
    var privateKey: SecKey? {
        get {
            return fetchPrivateKey()
        }
    }
    
    var publicKey: SecKey? {
        get {
            return fetchPublicKey()
        }
       
    }
    
    func genKeyPair() {
        if createPrivateKey() == false {
            print("Internal error - createPrivateKey failed")
        }
    }
    
    func test() {
        let testText = "KeyPair::test"
        guard let safePublicKey = publicKey else { return }
        guard let safePrivateKey = privateKey else { return }
        let textToEncryptData = testText.data(using: .utf8)!

        // encrypt
        guard let cipherText = SecKeyCreateEncryptedData(safePublicKey,
                                                         .rsaEncryptionOAEPSHA512,
                                                         textToEncryptData as CFData,
                                                         nil) as Data? else {
            return
        }
        
        // decrypt
        guard let clearTextData = SecKeyCreateDecryptedData(safePrivateKey,
                                                            .rsaEncryptionOAEPSHA512,
                                                            cipherText as CFData,
                                                            nil) as Data? else {
            return
        }

        guard let resultText = String(data: clearTextData, encoding: .utf8) else { return }
        if resultText == testText {
            print("KeyPair::test OK")
        } else {
            print("KeyPair::test FAILED")
        }
    }
}

private extension KeyPair {
    
    func fetchPublicKey() -> SecKey? {
        guard let privateKey = fetchPrivateKey() else { return nil }
        guard let publicKey = SecKeyCopyPublicKey(privateKey),
              let _ = SecKeyCopyExternalRepresentation(publicKey, nil) else {
            return nil
        }

        guard SecKeyIsAlgorithmSupported(publicKey, .encrypt, .rsaEncryptionPKCS1)
        else {
            print("Not supported cryptography")
            return nil
        }
        
        return publicKey
    }
    
    
    func getTag() -> Data? {
        let bundleID = Bundle.main.bundleIdentifier
        return bundleID?.data(using: .utf8)
    }
    
    func fetchPrivateKey() -> SecKey? {
        guard let tag = getTag() else { return nil }
        let query: CFDictionary = [kSecClass as String: kSecClassKey,
                                   kSecAttrApplicationTag as String: tag,
                                   kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
                                   kSecReturnRef as String: true] as CFDictionary

        var item: CFTypeRef?
        var status = SecItemCopyMatching(query, &item)
        guard status == errSecSuccess else {
            _ = createPrivateKey()
            status = SecItemCopyMatching(query, &item)
            return (item as! SecKey)
        }

        return (item as! SecKey)
    }
    
    func createPrivateKey() -> Bool {
        guard let tag = getTag() else { return false }
        let attributes: CFDictionary =
        [kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
         kSecAttrKeySizeInBits as String: 2048,
         kSecPrivateKeyAttrs as String:
            [kSecAttrIsPermanent as String: true,
             kSecAttrApplicationTag as String: tag as Any ]
        ] as CFDictionary
        
        var error: Unmanaged<CFError>?
        
        do {
            guard SecKeyCreateRandomKey(attributes, &error) != nil else {
                throw error!.takeRetainedValue() as Error
            }
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
