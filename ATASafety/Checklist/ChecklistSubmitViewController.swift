//
//  ChecklistSubmitViewController.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-18.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit
import MessageUI
import Alamofire

class ChecklistSubmitViewController: UIViewController {
    
    @IBOutlet weak var reportSummaryTextView: UITextView!
    
    var reportSummary = ""
    var submitted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reportSummaryTextView.text = ""
        reportSummary = "Safety Report Summary:\n"
        
        // User Info
        reportSummary = (reportSummary + "Full Name: " + getUserFirstName() + " " + getUserLastName() + "\n")
        reportSummary = (reportSummary + "Team Number: " + String(getUserTeamNumber()) + "\n")
        let date = Date.init()
        reportSummary = (reportSummary + "Issued At: " + date.description(with: Locale.current) + "\n")
        
        
        // Checklist Results
        for n in 0...(safetyChecklistValues.count-1){
            reportSummary = (reportSummary + "\n" + safetyChecklistItems[n] + "\n")
            if(safetyChecklistValues[n] == 0){
                reportSummary = (reportSummary + "Yes\n")
            } else if(safetyChecklistValues[n] == 1){
                reportSummary = (reportSummary + "No\n")
            } else if(safetyChecklistValues[n] == 2){
                reportSummary = (reportSummary + "N/A\n")
            }
        }
        
        reportSummaryTextView.text = reportSummary
        safetyReportSummary = reportSummary
    }
    
    @IBAction func submitReport(_ sender: Any) {
        if(!submitted){
            let slackConnect = SlackConnect()
            let pitReport = SlackPitReport(checklist: reportSummary, channel: SlackChannel)
            if(slackConnect.publishPitReport(report: pitReport)){
                reportSummaryTextView.text = "Report Submitted\nUse Back Button to Return to Main Menu"
                submitted = true
            } else {
                reportSummaryTextView.text = "An Error has Occured while submitting\nUse Back Button to Return to Main Menu"
            }
        }
        
    }
    
}
