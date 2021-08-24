//
//  AppRequest.swift
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

struct ResponseObject<T: Mappable> {
    var value: T?
    var error: DataError?
    var headers: [AnyHashable : Any]?
    
    /// Detect error if not use error object.
    
    var isVerified: Bool {
        guard let err = error else { return true }
        err.verify()
        return false
    }
}

struct ResponseArray<T: Mappable> {
    var value: [T]?
    var error: DataError?
    var headers: [AnyHashable : Any]?
    
    /// Detect error if not use error object.
    
    var isVerified: Bool {
        guard let err = error else { return true }
        err.verify()
        return false
    }
}

class AppRequest<T: Mappable> {
    
    private enum CompletionMethod {
        case Object, Array
    }
    
    private var keyPath: String = ""
    private var url: URLConvertible
    private var method: HTTPMethod = .get
    private var parameters: Parameters? = nil
    private var encoding: ParameterEncoding = URLEncoding.default
    private var headers: HTTPHeaders? = nil
    
    private let session = Session.default
    private var currentDataRequest: DataRequest?
    private var currentRequest: Alamofire.Request?
    private var completeMethod: CompletionMethod = .Object
    private var onCompleteObject: (_ResponseObject)?
    private var onCompleteArray: (_ResponseArray)?
    
    typealias _ResponseObject = (ResponseObject<T>) -> ()
    typealias _ResponseArray = (ResponseArray<T>) -> ()
    
    init(_ url: String,
         keyPath: String = "",
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         encoding: ParameterEncoding = URLEncoding.default,
         headers: HTTPHeaders? = nil)
    {
        self.url = url
        self.keyPath = keyPath
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }
    
    
    // MARK: - Drawing callback
        
    /// Return response with single object
    
    func completionObject(_ completion: @escaping _ResponseObject) {
        completeMethod = .Object
        onCompleteObject = { result in
            completion(result)
        }
    }
    
    /// Return response with array of object
    
    func completionArray(_ completion: @escaping _ResponseArray) {
        completeMethod = .Array
        onCompleteArray = { result in
            completion(result)
        }
    }
    
    
    // MARK: - Request
    
    private func requestObject() {
        
        currentRequest = AF.request(self.url,
                   method: self.method,
                   parameters: self.parameters,
                   encoding: self.encoding,
                   headers: self.headers
        ).responseObject(keyPath: self.keyPath) { (response: DataResponse<T, AFError>) in
            
            // headers response
            let responseHeader = response.response?.allHeaderFields
            
            // Handler error
            response.handlerError { (value: T?, error) in
                self.onCompleteObject?(ResponseObject<T>(value: value, error: error, headers: responseHeader))
            }
        }
    }
    
    private func requestArray() {
        
        currentRequest = AF.request(self.url,
                   method: self.method,
                   parameters: self.parameters,
                   encoding: self.encoding,
                   headers: self.headers
        ).responseArray(keyPath: self.keyPath) { (response: DataResponse<[T], AFError>) in
            
            // headers response
            let responseHeader = response.response?.allHeaderFields
            
            // Handler error
            response.handlerError { (value: [T]?, error) in
                self.onCompleteArray?(ResponseArray<T>(value: value, error: error, headers: responseHeader))
            }
        }
    }
    
    
    // MARK: - Control
    
    /// Start for request service
    
    func start() {
        self.startWithToken()
    }
    
    private func startWithToken() {
        if self.completeMethod == .Object {
            self.requestObject()
        }
        else if self.completeMethod == .Array {
            self.requestArray()
        }
    }
    
    /// Cancel and clear request
    
    func cancel() {
        currentRequest?.cancel()
        currentRequest = nil
    }
}
