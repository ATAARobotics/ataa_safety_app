//
//  ChecklistTableViewCell.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-19.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var resultSegmentedControl: UISegmentedControl!
    
    var cellID : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func resultChanged(_ sender: Any) {
        safetyChecklistValues[cellID] = resultSegmentedControl.selectedSegmentIndex
    }
    
}
