//
//  UserInfoSettingsViewController.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-19.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit

class UserInfoSettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var teamnumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        firstnameTextField.text = UserDefaults.standard.string(forKey: "userFirstName")
        lastnameTextField.text = UserDefaults.standard.string(forKey: "userLastName")
        teamnumberTextField.text = UserDefaults.standard.string(forKey: "userTeamNumber")
        firstnameTextField.becomeFirstResponder()
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        teamnumberTextField.delegate = self
    }
    
    @IBAction func firstnameChange(_ sender: Any) {
        UserDefaults.standard.set(firstnameTextField.text, forKey: "userFirstName")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func lastnameChange(_ sender: Any) {
        UserDefaults.standard.set(lastnameTextField.text, forKey: "userLastName")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func teamChange(_ sender: Any) {
        UserDefaults.standard.set(teamnumberTextField.text, forKey: "userTeamNumber")
        UserDefaults.standard.synchronize()
    }
//Keyboard Hide/Show when touch whitespace
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
//Dismiss keyboard when Return key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            view.endEditing(true)
            return false
    
    }
}

// Functions to get UserInfo

func getUserFirstName() -> String{
    return UserDefaults.standard.string(forKey: "userFirstName") ?? "Fill Out On Settings Page"
}

func getUserLastName() -> String{
    return UserDefaults.standard.string(forKey: "userLastName") ?? "Fill Out On Settings Page"
}

func getUserTeamNumber() -> Int{
    return UserDefaults.standard.integer(forKey: "userTeamNumber")
}
