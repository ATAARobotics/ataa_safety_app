//
//  CurrentEvents.swift
//  ATASafety
//
//  Created by Matthew Naruzny on 2020-02-29.
//  Copyright © 2020 Matthew Naruzny. All rights reserved.
//

import Foundation


private func getDate(dateString : String) -> Date {
    let dateFormatter = ISO8601DateFormatter()
    let calendar = Calendar.current
    let date = dateFormatter.date(from: dateString)
    let components = calendar.dateComponents([.year, .month, .day], from: date!)
    return calendar.date(from:components)!
}

let currentEvents : [Event] = [
    Event(display_name: "Canadian Pacific Regional Event", id_name: "canPac",start_date: getDate(dateString: "2020-03-04T07:00:00-0800"), end_date: getDate(dateString: "2020-03-07T07:00:00-0800"), location: "Victoria, Canada"),
    Event(display_name: "Canadian Rockies Regional Event", id_name: "canRock", start_date: getDate(dateString: "2020-04-01T07:00:00-0800"), end_date: getDate(dateString: "2020-04-04T07:00:00-0800"), location: "Calgary, Alberta")]
