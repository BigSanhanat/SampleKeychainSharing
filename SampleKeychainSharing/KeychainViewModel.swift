//
//  KeychainViewModel.swift
//  SampleKeychainSharing
//
//  Created by NotSmall on 29/1/2564 BE.
//

import Foundation
import SwiftKeychainWrapper

protocol KeychainViewModelDelegate {
    func setAppID(text:String)
    func setResultText(text:String)
}

class KeychainViewModel {
    
    private let keychainSharingKey = "T36PKL4C35.th.co.geotalent.KeychainSharing"
    private let keychainServiceName = "GOTUser"
    private let userKey = "user"
    
    var appId:String = "" {
        didSet {
            delegate.setAppID(text: "AppID is \(appId)")
        }
    }
    
    var userData:String! = "" {
        didSet {
            
            if let data = userData {
                delegate.setResultText(text: "data is \(data)")
            } else {
                delegate.setResultText(text: "Not Found")
            }
            
        }
    }
    
    var delegate:KeychainViewModelDelegate! = nil
    
    func fetchUser() {
        appId = Bundle.main.bundleIdentifier ?? "can't get it"
        
        //get keychain data
        let keychain = KeychainWrapper(serviceName: keychainServiceName, accessGroup: keychainSharingKey)
        userData = keychain.string(forKey: userKey)
    }
    
    func saveInput(inputText:String) {
        let keychain = KeychainWrapper(serviceName: keychainServiceName, accessGroup: keychainSharingKey)
        let success = keychain.set(inputText, forKey: userKey)
        print(success)
        fetchUser()
    }
    
    func clearKeychainData() {
        let keychain = KeychainWrapper(serviceName: keychainServiceName, accessGroup: keychainSharingKey)
        let success = keychain.removeObject(forKey: userKey)
        print(success)
        fetchUser()
    }
}
