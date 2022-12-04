//
//  Account.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol AccountProtocol {
    var accountID: String { get }

    func addKeyPairToWallet(keyPair: KeyPair)
    func updateBalance(balance: Int)
    func getBalance() -> Int
    func printBalance()
    func signData(message: String, index: Int) -> Data?
    func createOperation(recipient: Account, amount: Int, index: IndexPath) -> Operation
}

final class Account: Hashable {
    
    var wallet = [KeyPair]()
    var balance: Int = 0
    
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.accountID != rhs.accountID
    }
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(accountID)
    }
    
    init() {
        let keyPair = KeyPair()
        wallet.append(keyPair)
    }
    
}

extension Account: AccountProtocol {
    
    /**
        Returns accountId
        - can return empty string if occurs internal error(SecKey not allowed/not supported
     */
    var accountID: String {
        get {
            guard let publicKey = wallet.first?.publicKey else { return "" }
            if let cfdata = SecKeyCopyExternalRepresentation(publicKey, nil) {
               let data:Data = cfdata as Data
               return data.base64EncodedString()
            }
            return ""
        }
    }

    func addKeyPairToWallet(keyPair: KeyPair) {
        wallet.append(keyPair)
    }
    
    func updateBalance(balance: Int) {
        self.balance += balance
    }
    
    func getBalance() -> Int {
        return balance
    }
    
    func printBalance() {
        print("Account balance: \(balance)")
    }
    
    func signData(message: String, index: Int) -> Data? {
        let signature = Signature()
        guard wallet.count <= index else { return nil }
        guard let actualPublicKey = wallet[index].publicKey else { return nil }
        return signature.signData(publicKey: actualPublicKey, message: message)
    }
    
    func createOperation(recipient: Account, amount: Int, index: IndexPath) -> Operation {
        // TODO: will be implemented on stage #4
        Operation()
    }
    
}
