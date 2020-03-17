//
//  ChecklistSubmitViewController.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-18.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import UIKit
import Alamofire
import FirebaseAnalytics

class ChecklistSubmitViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var submitButton: UIBarButtonItem!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var reportSummaryTextView: UITextView!
    
    var reportSummary = ""
    var submitted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //sets up Buttons
        doneButton.isEnabled = false
        submitButton.isEnabled = true
        backButton.isEnabled = true
        
        Analytics.setScreenName("Checklist Submit View", screenClass: "Checklist Submit View Controller")
        
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
        
        Analytics.logEvent("safety_report_submitted", parameters: [:])
        
        if(!submitted){
            let slackConnect = SlackConnect()
            let pitReport = SlackPitReport(checklist: reportSummary, channel: SlackChannel)
            if(slackConnect.publishPitReport(report: pitReport)){
                reportSummaryTextView.text = "Report Submitted\nPress done to return to main menu"
                submitButton.isEnabled = false
                doneButton.isEnabled = true
                backButton.isEnabled = false
            } else {
                reportSummaryTextView.text = "An Error has Occured while submitting\nPress Back to go back and try again"
            }
        }
        
    }
    
}
