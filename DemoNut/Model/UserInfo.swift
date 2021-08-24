//
//  UserInfo.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit
import ObjectMapper
import AlamofireObjectMapper

class UserInfo: BaseInfo, Mappable {
    
    override init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        // Mapping from 'key'
        identifier <- map["id"]
    }
    
    
    //MARK: -  Security with encryption key
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        identifier = aDecoder.decodeInteger(forKey: "userId")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.identifier, forKey: "userId")
    }
}
