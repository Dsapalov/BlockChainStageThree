//
//  Blockchain.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol BlockchainProtocol {
    var coinDatabase: [Account: Int] { get set }
    var blockHistory: [Block] { get set }
    var txDatabase: [Transaction] { get set }
    var faucetCoins: Int { get set }
    
    static func initBlockchain() -> Blockchain
    static func getTokenFromFaucet(account: Account, amount: Int)
    static func validateBlock(block: Block)
    static func showCoinDatabase()
    func toString() -> String
    func print()
}

final class Blockchain {
    
}

extension Blockchain: BlockchainProtocol {
    var coinDatabase: [Account : Int] {
        get {
            return coinDatabase
        }
        set {
            
        }
    }
    
    var blockHistory: [Block] {
        get {
            return blockHistory
        }
        set {
            
        }
    }
    
    var txDatabase: [Transaction] {
        get {
            return txDatabase
        }
        set {
            
        }
    }
    
    var faucetCoins: Int {
        get {
            return faucetCoins
        }
        set {
            
        }
    }
    
    static func initBlockchain() -> Blockchain {
        Blockchain()
    }
    
    static func getTokenFromFaucet(account: Account, amount: Int) {
        
    }
    
    static func validateBlock(block: Block) {
        
    }
    
    static func showCoinDatabase() {
        
    }
    
    func toString() -> String {
        "----"
    }
    
    func print() {
        
    }
    
    
}
