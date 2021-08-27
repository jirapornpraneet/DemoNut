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
    
    var canApprove = false
    var canStamp = false
    var isEnableOT = true
    var isManager = false
    var badgeNews = 0
    var badgeNotification = 0
    var badgeApproval = 0
    var isForgotStamp = false
    var forgotStampAlert = ""

    
    override init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        canApprove <- map["canApprove"]
        canStamp <- map["canStamp"]
        isEnableOT <- map["isUseOT"]
        isManager <- map["isManager"]
        badgeNews <- map["badgeNews"]
        badgeNotification <- map["badgeNotification"]
        badgeApproval <- map["badgeApproval"]
        isForgotStamp <- map["isForgotStampTime"]
        forgotStampAlert <- map["forgotStampTimeText"]
    }
}
