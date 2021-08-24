//
//  SchemeData.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

class SchemeData {
    
    /// feature for action
    var feature: SchemeData.Features = .UnKnow
    
    /// Title from url scheme
    var title: String = ""
    
    /// Id from url scheme
    var id: Int = 0
    var ids: String = "0" {
        didSet {
            id = Int(ids) ?? 0
        }
    }
    
    enum Features: String {
        
        case Notification   = "notification"
        case UnKnow         = "unknow"
        
        static func toCase(_ value: String) -> Features {
            if let feature = Features(rawValue: value) {
                return feature
            }
            return .UnKnow
        }
    }
}
