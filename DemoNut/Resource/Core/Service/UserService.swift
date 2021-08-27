//
//  UserService.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit
import Alamofire

class UserService: BaseService {
    
    /// Register
    
    func requestForRegister() -> AppRequest<UserInfo>?  {
        path = "register/email"
        
        // Parameter
        let param = ["foo": "bar"]
        
        // return 'Request' for each service
        return AppRequest<UserInfo>(self.url, keyPath: "data", method: .get, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
    
    /// Login
    
    func requestForLogin() -> AppRequest<UserInfo>?  {
        path = "/Mobile/GetConfig"
        
        let param = [
            "fcm_token" : "token3",
            "deviceId" : "device1",
            "platform" : 0, // 0 = android, 1 = ios
            "os" : "0.1.1"
        ] as Parameters
        
        return AppRequest<UserInfo>(self.url, keyPath: "data", method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers)
    }
}
