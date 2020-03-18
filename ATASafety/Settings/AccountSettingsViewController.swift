//
//  AccountSettingsViewController.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-20.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit

class AccountSettingsViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = UserDefaults.standard.string(forKey: "slackUsername")  ?? "Not Logged In"
    }
    
    @IBAction func signInSlack(_ sender: Any) {
        
    }
    
}

