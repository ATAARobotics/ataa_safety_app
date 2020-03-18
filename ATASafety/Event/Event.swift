//
//  Eventt.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-25.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import Foundation

struct Event : Codable{
    var display_name : String = ""
    var short_display_name : String = ""
    var id_name : String = ""
    var start_date : Date = Date()
    var end_date : Date = Date()
    var location : String = ""
}
