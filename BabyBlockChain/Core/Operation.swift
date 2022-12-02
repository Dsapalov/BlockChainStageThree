//
//  Operation.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol OperationProtocol {
    var sender: Account { get set}
    var receiver: Account { get set}
    var amount: Int { get set}
    var signature: Data { get set}
    
    static func createOperation(sender: Account, receiver: Account, amount: Int, signature: Data) -> Operation
    static func verifyOperation(operation: Operation) -> Bool
    
    func toString() -> String
    func print()
}

final class Operation {
    
}

extension Operation: OperationProtocol {
    var sender: Account {
        get {
            return sender
        }
        set {
            
        }
    }
    
    var receiver: Account {
        get {
            return receiver
        }
        set {
            
        }
    }
    
    var amount: Int {
        get {
            return amount
        }
        set {
            
        }
    }
    
    var signature: Data {
        get {
            return signature
        }
        set {
            
        }
    }
    
    static func createOperation(sender: Account, receiver: Account, amount: Int, signature: Data) -> Operation {
        return Operation()
    }
    
    static func verifyOperation(operation: Operation) -> Bool {
        return false
    }
    
    func toString() -> String {
        return "----"
    }
    
    func print() {
        
    }
    
    
}
