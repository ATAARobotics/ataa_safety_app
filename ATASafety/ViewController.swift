//
//  ViewController.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-17.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Analytics.setScreenName("Home Screen", screenClass: "Home Screen View Controller")
    }


}

