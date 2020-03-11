//
//  AboutPageViewController.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-26.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit

class AboutPageViewController: UIViewController {

    @IBOutlet weak var appVerionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        appVerionLabel.text = ("ATA Safety App v" + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "error"))
        //Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
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
