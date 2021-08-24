//
//  DataError.swift
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

public struct DataError {
    var message: String?
    var status: HTTPStatus?
    
    /// Error action if needed
    
    func verify() {
        AppDirector.sharedInstance.error(self)
    }
}

extension DataResponse {
    
    func handlerError(_ completion: @escaping (Success?, DataError?)->()) {
        
        // Error Case
        if let error = self.error, let response = self.response {
            
            // Default
            let _error = DataError(message: error.localizedDescription, status: response.status)
            
           // Can't map data JSON because 'key path' is incorrect
           if let res = self.response, res.status.responseType == .success {
            
               completion(nil, _error)
            
           } else { // Try Mapping error JSON message
               
               do {
                    let dict = try JSONSerialization.dictionary(data: self.data!, options: [])
                    let err = DataError(message: (dict["message"] as? String) ?? _error.message, status: _error.status)
                    completion(nil, err)
                   
               } catch _ {
                   completion(nil, _error)
               }
           }
        } else {
            completion(self.value, nil)
        }
    }
}


