//
//  Authentication.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

class Authentication {
    
    enum VerifyState {
        
        /// Refresh Token if needed (Token is expired.)
        
        case RefreshToken
        
        /// Force Logout & present login page
        
        case ForceLogout
        
        /// Do nothing (Verify passed.)
        
        case DoNothing
    }
    
    // MARK: - Validate
    
    /// Only detect ' loged in ' or ' Loged out '
    
    var isAuthenticated: Bool {
        return hasAccessToken && hasRefreshToken
    }
    
    var hasAccessToken: Bool {
        return accessToken != nil
    }
    
    var hasRefreshToken: Bool {
        return refreshToken != nil
    }
    
    var isAccessTokenExpired: Bool {
        guard let accToken = accessToken else { return true }
        guard let decoding = decodeToken(token: accToken) else {
            return true
        }
        return decoding.expired <= Date()
    }
    
    var isRefreshTokenExpired: Bool {
        guard let rfsToken = refreshToken else { return true }
        guard let decoding = decodeToken(token: rfsToken) else {
            return true
        }
        return decoding.expired <= Date()
    }
    
    
    /// Decode
    
    func decodeToken(token: String) -> Token? {
        let decoder = TokenDecoder()
        guard let decoding = decoder.decode(token: token) else {
            return nil
        }
        return decoding
    }
    
    
    // MARK: - Token Data
    
    /// Token object
    
    private var _token: Token? {
        guard let data = DataStore.object(forKey: Constant.Key.Store.token) else { return nil }
        let token = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! Token
        return token
    }
    
    var token: Token? {
        get {
            return _token
        }
    }
    
    /// Access token
    
    var accessToken: String? {
        guard let _token = self.token else { return nil }
        guard !_token.accessToken.isEmpty else { return nil }
        return _token.accessToken
    }
    
    /// Refresh token
    
    var refreshToken: String? {
        guard let _token = self.token else { return nil }
        guard !_token.refreshToken.isEmpty else { return nil }
        return _token.refreshToken
    }
    
    
    // MARK: - Control
    
    func setToken(_ token: Token) {
        let encoded = NSKeyedArchiver.archivedData(withRootObject: token)
        DataStore.set(encoded, forKey: Constant.Key.Store.token)
    }
    
    private func clearToken() {
        DataStore.remove(forKey: Constant.Key.Store.token)
    }
    
    func resetAuthentication() {
        clearToken()
    }
    
    
    // MARK: - Verify Authen
    
    var verify: Authentication.VerifyState {
                /// Condition
        if self.isAuthenticated { // Logged in
            if self.isAccessTokenExpired {
                if self.isRefreshTokenExpired {
                    return .ForceLogout
                }
                return .ForceLogout
            }
            return .DoNothing
        }
        return .ForceLogout
    }
}
