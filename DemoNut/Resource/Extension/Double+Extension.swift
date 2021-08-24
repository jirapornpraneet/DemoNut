//
//  Double+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

extension Double {
    
    /// To string value (If number is 0, return blank.)
    var stringValue: String { return self == 0 ? "" : "\(self)" }
    
    /// Double to Date
    var toDate: Date? {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
        
    /// To integer.
    var toInt: Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        }
        return nil
    }
}
