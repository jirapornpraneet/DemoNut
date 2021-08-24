//
//  String+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

extension String {
    
    // Compare
    
    static func ==(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedSame
    }
    
    static func <(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedAscending
    }
    
    static func <=(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedAscending || lhs.compare(rhs, options: .numeric) == .orderedSame
    }
    
    static func >(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedDescending
    }
    
    static func >=(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedDescending || lhs.compare(rhs, options: .numeric) == .orderedSame
    }
    
    
    // Add on
    
    func add(suffix: String) -> String {
        return self + suffix
    }
    
    func add(prefix: String) -> String {
        return prefix + self
    }
    
    func regex(_ pattern: RegularPattern) -> Bool {
        return self.regex(pattern.rawValue)
    }
    
    func regex(_ pattern: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: self.count)
        if regex.matches(in: self, options: [], range: range).count > 0 {
            return true
        }
        return false
    }
    
    /// Split string to array of string.
    func split(with key: String = ",") -> [String] {
        return self.components(separatedBy: key)
    }
    
    /// Convert string to int.
    var toInt: Int? { return Int(self) }
    
    /// Localizable string.
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: BundleInfo.localizedBundle, value: "", comment: "")
    }
    
    /// Detect string is number format.
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    /// Convert string to date with format.
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss", local: Locale = .current, calendar: Calendar = .current, timezone: TimeZone = .current) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timezone
        dateFormatter.locale = local
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
