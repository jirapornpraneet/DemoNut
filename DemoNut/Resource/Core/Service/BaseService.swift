//
//  BaseService.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class BaseService: NSObject {

    private var request: AppRequest<Token>?
    var parameter : [String:Any] = [:]
    var baseURL: String = ""
    var path: String = ""
    var accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Im5PbzNaRHJPRFhFSzFqS1doWHNsSFJfS1hFZyIsImtpZCI6Im5PbzNaRHJPRFhFSzFqS1doWHNsSFJfS1hFZyJ9.eyJhdWQiOiJhcGk6Ly84ZDA4NjBlMi0xNzI5LTQ3ZDQtOWFiOS1kYTQzMjk1ZDcxNmUiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC80MGE1NTgwYS1mYjMzLTRjZDYtYjlhZS1hYzJkMWY0MTM1ZTAvIiwiaWF0IjoxNjMwNDg0NzIxLCJuYmYiOjE2MzA0ODQ3MjEsImV4cCI6MTYzMDUxNTYyMSwiYWNyIjoiMSIsImFpbyI6IkUyWmdZRGozeU9CVnVhV1IrdFFWM2RsZUgwSmRnMDRWblAzZ1BhbjZzMUZ0K01VN0RlOEIiLCJhbXIiOlsicHdkIl0sImFwcGlkIjoiOGQwODYwZTItMTcyOS00N2Q0LTlhYjktZGE0MzI5NWQ3MTZlIiwiYXBwaWRhY3IiOiIxIiwiZmFtaWx5X25hbWUiOiJUZXN0IiwiZ2l2ZW5fbmFtZSI6IlBlcnNvbiIsImlwYWRkciI6IjE3MS43LjI1LjE0MiIsIm5hbWUiOiJQZXJzb24gIFRlc3QiLCJvaWQiOiJmNTBkZjcyOC02NzJlLTQ5ODYtOWFlMi1mZDY3YmVmNGJlMzUiLCJyaCI6IjAuQVZRQUNsaWxRRFA3MWt5NXJxd3RIMEUxNE9KZ0NJMHBGOVJIbXJuYVF5bGRjVzVVQU1VLiIsInNjcCI6InNvYy1hcGkiLCJzdWIiOiJZV0dBZFF6RnRmeDE1TVZkOURLLVBlVlpOSXJDSkVxM09vS2o1S3ItbEpzIiwidGlkIjoiNDBhNTU4MGEtZmIzMy00Y2Q2LWI5YWUtYWMyZDFmNDEzNWUwIiwidW5pcXVlX25hbWUiOiJwZXJzb25AcGllc29mdGFkLm9ubWljcm9zb2Z0LmNvbSIsInVwbiI6InBlcnNvbkBwaWVzb2Z0YWQub25taWNyb3NvZnQuY29tIiwidXRpIjoiMDhHWHFmMkN1a0swejFyenA4ekpBQSIsInZlciI6IjEuMCJ9.XpVlXz_euUWCOVoa4ZydbTg3jrjLGNZ5ydkOUWkVDu4a4LaDR9UwPLVLuAFweHL58ewt0pfH_y-YSY6S7jh9GHRpILXgMhKvQFVFr-MmP8oQz8OAAAkMwrgYyCdRq8YCC_zhUi1JKREkQv7BoAWXlrKXxvrt2lAPbRtzQ2i45E7KDGXWMVEPN3z3C_xYEZLhezSQp6BS0Lqq9AkSZTnPEPPhmVJmOVVQlGEeXj-9n7qyRsAhVwqF4YdF9YIINiBMJIof62fteOTSdJ1cHqd2VnTGjE51Dqu7fm5ONVkjvkJ9nor7EyrkDkn0zCsfmfGuFXY598vb7O2LlSMPGOwfEA"
    
    var url: String {
        return baseURL.add(suffix: path)
    }
    
    private var endpoint: Endpoint! {
        didSet {
            self.baseURL = endpoint.URL.add(suffix: path)
        }
    }
    
    
    // MARK: - Base function
    
    init(_ endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    init(_ endpoint: String) {
        self.baseURL = endpoint
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": "Bearer \(accessToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
    }
    
    func fetchToken(_ refreshToken: String? = nil, _ completion: ((_ token: Token?) -> ())? = nil) {
        
        /// Endpoint
        let endpoint = refreshToken == nil ? Endpoint.Token.URL : Endpoint.ReToken.URL
        
        /// Parameter
        let parameters: [String: Any] = [:]
        
        /// AF
        request = AppRequest(endpoint, keyPath: "data", method: .post, parameters: parameters)
        request?.completionObject({ (response) in
            
            /// verify request not have errors
            guard response.isVerified else { return }
            
            /// Response if needed
            completion?(response.value)
            self.cancelRefreshToken()
        })
        request?.start()
    }
    
    func cancelRefreshToken() {
        request?.cancel()
        request = nil
    }
}
