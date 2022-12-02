//
//  ViewController.swift
//  BabyBlockChain
//
//  Created by Denis Sapalov on 02.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let keyPair = KeyPair()
        let signature = Signature()
        let testMessage = "Test message"
        guard let privateKey = keyPair.privateKey else {
            print("Internal error - privateKey nil")
            return
        }
        
        guard let publicKey = keyPair.publicKey else {
            print("Internal error - public key nil")
            return
        }
        
        let signedData = signature.signData(publicKey: publicKey, message: testMessage)
        guard let safeSignedData = signedData else {
            print("Internal error - signature.signData failed")
            return
        }
        
        let isVerified = signature.verifySignature(realSig: safeSignedData, message: testMessage, priv: privateKey)
        
        if isVerified {
            print("Signature works fine")
        } else {
            print("Signature works wrong")
        }
    }


}

