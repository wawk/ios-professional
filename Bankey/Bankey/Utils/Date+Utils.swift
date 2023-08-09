//
//  Date+Utils.swift
//  Bankey
//
//  Created by Steve Moody on 8/4/23.
//

import Foundation

extension Date {
    static var BankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "EDT")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.BankeyDateFormatter
        dateFormatter.dateFormat = "MM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
