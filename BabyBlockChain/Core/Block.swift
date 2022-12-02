//
//  Block.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol BlockProtocol {
    var blockID: String { get set }
    var prevHash: String { get set }
    var setOfTransaction: [Transaction] { get set }
    
    static func createBlock(setOfTransaction: [Transaction], prevHash: String) -> Block
    func toString() -> String
    func print()
}

final class Block {
    
}

extension Block: BlockProtocol {
    var blockID: String {
        get {
            return blockID
        }
        set {
                    
        }
    }
    
    var prevHash: String {
        get {
            return prevHash
        }
        set {
            
        }
    }
    
    var setOfTransaction: [Transaction] {
        get {
            return setOfTransaction
        }
        set {
            
        }
    }
    
    static func createBlock(setOfTransaction: [Transaction], prevHash: String) -> Block {
        Block()
    }
    
    func toString() -> String {
        "---"
    }
    
    func print() {
        
    }
    
    
}
