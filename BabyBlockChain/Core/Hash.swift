//
//  Hash.swift
//  BlockChainStageOne
//
//  Created by Denis Sapalov on 28.11.2022.
//

import Foundation

protocol HashProtocol {
    static func toSHA1(message: String) -> String
}

final class Hash {
    
}

extension Hash: HashProtocol {
    
    static func toSHA1(message: String) -> String {
        return "----"
    }
    
}
