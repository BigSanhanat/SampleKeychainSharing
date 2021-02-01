//
//  ViewController.swift
//  SampleKeychainSharing
//
//  Created by NotSmall on 29/1/2564 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appIdLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    var keychainViewModel:KeychainViewModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        keychainViewModel = KeychainViewModel()
        keychainViewModel.delegate = self
        keychainViewModel.fetchUser()
    }

    @IBAction func saveButton_Clicked(_ sender: Any) {
        keychainViewModel.saveInput(inputText: inputTextField.text ?? "")
    }
    
    @IBAction func clearButton_Clicked(_ sender: Any) {
        keychainViewModel.clearKeychainData()
    }
}

extension ViewController: KeychainViewModelDelegate {
    func setAppID(text: String) {
        appIdLabel.text = text
    }
    
    func setResultText(text: String) {
        userLabel.text = text
    }
}
