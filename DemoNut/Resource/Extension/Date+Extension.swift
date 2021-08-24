//
//  Date+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

extension Date {
    
    /// New initial function with string.
    init(_ dateString: String, format: String = "yyyy-MM-dd", local: Locale = .current) {
        let formatter = DateFormatter()
        formatter.locale = local
        formatter.dateFormat = format
        let date = formatter.date(from: dateString) ?? Date()
        self.init(timeInterval:0, since:date)
    }
    
    /// Today date range.
    static var today: DateRange {
        let start = Calendar.current.date(bySettingHour: 0, minute: 0, second: 1, of: Date())!
        let end = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: Date())!
        return (start: start, end: end)
    }
    
    /// Date to string with normal format.
    func toString(format: String = "yyyy-MM-dd", style: DateFormatter.Style = .short, local: Locale = .current, calender: Calendar = .current) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// String of time ago.
    func time(since fromDate: Date) -> String {
        let earliest = self < fromDate ? self : fromDate
        let latest = (earliest == self) ? fromDate : self

        let allComponents: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let components: DateComponents = Calendar.current.dateComponents(allComponents, from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0

        let descendingComponents = ["year"  : year,
                                    "month" : month,
                                    "week"  : week,
                                    "day"   : day,
                                    "hour"  : hour,
                                    "minute": minute,
                                    "second": second]
        for (period, timeAgo) in descendingComponents {
            if timeAgo > 0 {
                return "\(timeAgo.of(period)) ago"
            }
        }
        return "Just now"
    }
}
