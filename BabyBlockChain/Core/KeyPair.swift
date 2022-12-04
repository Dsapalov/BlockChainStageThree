//
//  KeyPair.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol KeyPairProtocol {
    
    var privateKey: PrivateKey? { get }
    var publicKey: PublicKey? { get }
    
}

typealias PublicKey = SecKey
typealias PrivateKey = SecKey

final class KeyPair {
    
    init() {
        if createPrivateKey() == false {
            print("Internal error - createPrivateKey failed")
        }
    }
}

extension KeyPair: KeyPairProtocol {
    var privateKey: PrivateKey? {
        get {
            return fetchPrivateKey()
        }
    }
    
    var publicKey: PublicKey? {
        get {
            return fetchPublicKey()
        }
    }
    
}

private extension KeyPair {
    
    func fetchPublicKey() -> PublicKey? {
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
    
    func fetchPrivateKey() -> PrivateKey? {
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
            return (item as! PrivateKey)
        }

        return (item as! PrivateKey)
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
