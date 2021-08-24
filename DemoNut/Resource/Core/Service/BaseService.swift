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
    
    var url: String {
        return baseURL
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
        return [
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
