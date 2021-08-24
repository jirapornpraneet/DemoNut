//
//  Endpoint.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

enum Endpoint: String {
    
    /// for fetch new token
    case Token      = "token/"
    /// for refresh token
    case ReToken    = "token/refresh"
    /// for all user's service
    case User       = "user/"
    /// for all ticket's service
    case Ticket     = "ticket/"
    
    // Add new case next line.
    
    /// full path endpoint url.
    var URL: String {
        return Environment.current.host + self.rawValue
    }
}
