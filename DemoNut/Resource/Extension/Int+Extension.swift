//
//  Int+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

extension Int {
    
    /// To string value (If number is 0, return blank.)
    var stringValue: String { return self == 0 ? "" : "\(self)" }
    
    /// Parse to string.
    var toString: String { return "\(self)" }
    
    /// Even value.
    var isEven: Bool { return self % 2 == 0 }
    
    /// To decimal (e.g. 1000 => 1,000)
    var toDecimal: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? "N/A"
    }
    
    /// Private number decimal
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
    
    /// Return number of nouns (Singular, Plural)
    func of(_ nouns: String) -> String {
        guard self != 1 else { return "\(self) \(nouns)" }
        return "\(self) \(nouns)s"
    }
}
