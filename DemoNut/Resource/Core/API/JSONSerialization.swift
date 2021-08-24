//
//  JSONSerialization.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

extension JSONSerialization {

    enum Errors: Error {
        case NotDictionary
        case NotJSONFormat
    }

    public class func dictionary(data: Data, options opt: JSONSerialization.ReadingOptions) throws -> NSDictionary {
        do {
            let JSON = try JSONSerialization.jsonObject(with: data , options:opt)
            if let JSONDictionary = JSON as? NSDictionary {
                return JSONDictionary
            }
            throw Errors.NotDictionary
        }
        catch {
            throw Errors.NotJSONFormat
        }
    }
}
