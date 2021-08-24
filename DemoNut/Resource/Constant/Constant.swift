//
//  Constant.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

class Constant {
    
    struct Key {
        
        /// Key for encrypt object.
        
        struct Encrypt {
            static let accessToken    = "app.encrypt.key.accesstoken"
            static let refreshToken   = "app.encrypt.key.refreshtoken"
        }
        
        /// Key for store data.
        
        struct Store {
            static let language = "app.store.key.language"
            static let token = "app.store.key.token"
        }
        
        /// Key for local notification.
        
        enum LocalNotification: String {
            case UpdateUser = "app.notification.key.user.update"
        }
    }
    
    struct Formatt {
        
        struct Date {
            static let input  = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        }
        
        enum RegularExpression: String {
            case name       = "[a-zA-Zก-ฮะ-์\\s]"
            case email      = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,6})$"
            case phone      = "^(0+[6,8,9])+([0-9]{8})|(\\+66)+([0-9]{9})$"
            case site       = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
            case coordinate = "([0-9]+\\.[0-9]+)"
            case scheme     = "[a-zA-Z0-9]+://[a-zA-Z0-9_\\-\\.]+"
            
            static var customScheme: String {
                return BundleInfo.scheme + "://[a-zA-Z0-9_\\-\\.]+"
            }
        }
    }
}
