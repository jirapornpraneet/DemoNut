//
//  AppGlobal.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit
import Alamofire

class AppGlobal: NSObject {
    
    static let sharedInstance = AppGlobal()
    
    // Context
    var authen: Authentication!
    var context: Context!
    var service: Service!
    
    func initial() {
        buildCore()
    }
    
    private func buildCore() {
        authen = Authentication()
        context = Context()
        service = Service()
    }
    
    
    /// verify login and reaction
    
    func verifyLogin() {
        switch self.authen.verify {
            
            case .RefreshToken: break
                /// Refresh Token if needed
            
            case .ForceLogout: break
                /// Force Logout & present login page
            
            case .DoNothing: break
                /// Do nothing (Verify passed.)
        }
    }
}


// MARK: - Token

extension AppGlobal {
    
    func clearToken() {
        self.authen.resetAuthentication()
    }
    
    func refreshToken(_ completion: (() -> ())? = nil) {
        
        /// Refresh token if has refresh token.
        if let reToken = self.authen.refreshToken {
            self.requestForToken(reToken) {
                completion?()
            }
        } else {
            /// Force Logout, Present login scene
        }
    }
    
    func fetchToken(_ completion: (() -> ())? = nil) {
        self.requestForToken {
            completion?()
        }
    }
    
    private func requestForToken(_ refreshToken: String? = nil, completion: (() -> ())? = nil) {
        
        self.service.user.cancelRefreshToken()
        self.service.user.fetchToken(refreshToken) { _token in
            if let token = _token {
                /// Store a token.
                self.authen.setToken(token)
                completion?()
                
            } else {
                /// Reaction for token is nil (e.g. Alert)
            }
        }
    }
}

