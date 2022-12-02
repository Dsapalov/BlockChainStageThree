//
//  Account.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol AccountProtocol {
    var accountID: String { get set }
    var wallet: [KeyPair]  { get set }
    var balance: Int  { get set }

    static func genAccount() -> Account
    static func addKeyPairToWallet(keyPair: KeyPair)
    static func updateBalance(balance: Int)
    static func getBalance() -> Int
    static func printBalance()
    static func signData(message: String, index: Int) -> Data
    static func createOperation(recipient: Account, amount: Int, index: IndexPath) -> Operation
    func toString() -> String
    func print()
}

final class Account: Hashable {
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.accountID != rhs.accountID
    }
    
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(accountID)
    }
    
    
    
}

extension Account: AccountProtocol {
    var accountID: String {
        get {
            return accountID
        }
        set {
            
        }
    }
    
    var wallet: [KeyPair] {
        get {
            return wallet
        }
        set {
            
        }
    }
    
    var balance: Int {
        get {
            return balance
        }
        set {
            
        }
    }
    
    static func genAccount() -> Account {
        Account()
    }
    
    static func addKeyPairToWallet(keyPair: KeyPair) {
        
    }
    
    static func updateBalance(balance: Int) {
        
    }
    
    static func getBalance() -> Int {
        return 0
    }
    
    static func printBalance() {
        
    }
    
    static func signData(message: String, index: Int) -> Data {
        return Data()
    }
    
    static func createOperation(recipient: Account, amount: Int, index: IndexPath) -> Operation {
        Operation()
    }
    
    func toString() -> String {
        "---"
    }
    
    func print() {
        
    }
    

    
    
}
