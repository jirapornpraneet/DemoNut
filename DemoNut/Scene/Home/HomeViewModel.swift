//
//  HomeViewModel.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class HomeViewModel {
    
    var request: AppRequest<UserInfo>?
    var datasource = UserInfo()
        
    struct Sender {
        var id: Int
    }
    
    /// Variable Sender
    var sender: Sender?
    
    // Code here to create your view model
}

extension HomeViewModel {
    
    // Code here to call data
    func requestData(_ completion: ((_ success: Bool) -> ())? = nil) {
    
        request = AppGlobal.sharedInstance.service.user.requestForLogin()
        request?.completionObject({ (response: ResponseObject<UserInfo>) in
            guard response.isVerified else { completion?(false)
                return
            }

            if let value = response.value {
                self.datasource = value
                completion?(true)
            }
            self.request = nil
        })
        request?.start()
    }
}
