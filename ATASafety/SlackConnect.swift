//
//  SlackConnect.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-03-01.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import Foundation
import Alamofire

class SlackConnect{
    
    func publishPitReport(report : SlackPitReport) -> Bool {
        let headers : HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": ("Bearer " + SlackBotToken)
        ]
        
        let parameters : [String:String] = [
            "text" : report.checklist,
            "channel" : report.channel
        ]
        
        var success = true
        
        AF.request("https://slack.com/api/chat.postMessage", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).responseJSON{(response) in
            //Use Response
            print(response)
            if(response.error != nil){
                success = false
            }
        }
        return success
    }
}

struct SlackPitReport: Encodable{
    let checklist : String
    let channel : String
}
