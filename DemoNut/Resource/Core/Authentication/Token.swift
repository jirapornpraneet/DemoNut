//
//  Token.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit
import ObjectMapper
import AlamofireObjectMapper

class Token: NSObject, Mappable, NSCoding  {
    
    var accessToken = ""
    var refreshToken = ""
    
    private var expired_text = ""
    private var expired_timestamp: Double = 0
    
    /// Expired date of token
    var expired: Date {
        /// decode from token
        return expired_timestamp.toDate ?? Date()
    }
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        
        // Map from 'key'
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        
        // For decode JWT
        expired_timestamp <- map["expired"]
    }
    
    
    //MARK: -  Security with encryption key
    
    required init?(coder aDecoder: NSCoder) {
        self.accessToken = aDecoder.decodeObject(forKey: Constant.Key.Encrypt.accessToken) as! String
        self.refreshToken = aDecoder.decodeObject(forKey: Constant.Key.Encrypt.refreshToken) as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.accessToken, forKey: Constant.Key.Encrypt.accessToken)
        aCoder.encode(self.refreshToken, forKey: Constant.Key.Encrypt.refreshToken)
    }
}
