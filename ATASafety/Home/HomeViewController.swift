//
//  HomeViewController.swift
//  ATASafety
//
//  Created by Albert Wood on 2020-03-18.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Home";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
