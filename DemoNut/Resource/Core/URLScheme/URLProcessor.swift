//
//  URLProcessor.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

class URLProcessor {
    private var urlString: String!
    var scheme = SchemeData()
    
    init(_ url: String) {
        self.urlString = url
        self.processURL()
    }
    
    private func processURL() {
    
        guard let url = URL(string: urlString) else {
            print("=>> Wrong URL")
            return
        }
        
        guard UIApplication.shared.canOpenURL(url) else {
            print("=>> Can not open URL")
            return
        }
        
        if url.absoluteString.regex(RegularPattern.customScheme) {
            
            //let arr: [String] = url.absoluteString.components(separatedBy: "://")
            //let data: [String] = arr[1].components(separatedBy: "?").filter({ !$0.isEmpty })
            
            // Find Param
            guard url.params.count > 0 else {
                print("=>> No parameter")
                return
            }
            
            self.manageParameters(url)
            self.manageFeatures(url.host ?? "unknow")
            
        } else if url.absoluteString.regex(.site) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func manageFeatures(_ features: String) {
        self.scheme.feature = SchemeData.Features.toCase(features)
    }
    
    private func manageParameters(_ url: URL) {
        
        let params = url.params
        if let id = params["id"] as? String {
            self.scheme.ids = id
        }
        
        if let title = params["title"] as? String {
            self.scheme.title = title
        }
    }
}


