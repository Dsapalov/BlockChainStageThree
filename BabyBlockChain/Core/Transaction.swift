//
//  Transaction.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol TransactionProtocol {
    var transactionID: String { get set }
    var setOfOperations: [Operation] { get set }
    var nonce: Int { get set }
    
    static func createTransacition(setOfOperations: [Operation], nonce: Int) -> Transaction
    func toString() -> String
    func print()
}

final class Transaction {
    
}

extension Transaction: TransactionProtocol {
    var transactionID: String {
        get {
            return transactionID
        }
        set {
            
        }
    }
    
    var setOfOperations: [Operation] {
        get {
            return setOfOperations
        }
        set {
            
        }
    }
    
    var nonce: Int {
        get {
            return nonce	
        }
        set {
            
        }
    }
    
    static func createTransacition(setOfOperations: [Operation], nonce: Int) -> Transaction {
        return Transaction()
    }
    
    func toString() -> String {
        return "----"
    }
    
    func print() {
        
    }
    
}
