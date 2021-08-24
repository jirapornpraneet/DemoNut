//
//  Service.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

struct Service {
    
    // Service
    var user: UserService!
    
    init() {
        self.user = UserService(.User)
    }
}
