//
//  Environment.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

enum Environment {
    
    /// Develop endpoint
    case Develop
    /// Staging endpoint
    case Staging
    /// Production endpoint
    case Production
    
    var name: String {
        return Environment.config_name[self]!
    }
    
    var host: String {
        return Environment.env_host[self]!
    }
    
    /// custom configuration name
    
    static var config_name: [Environment: String] { return [
        .Develop:       "Develop",
        .Staging:       "Staging",
        .Production:    "Production"
    ]}
    
    /// custom configuration host
    
    static var env_host: [Environment: String] { return [
        .Develop:       "http://27.254.94.169:12012/api/v1/",
        .Staging:       "http://27.254.94.169:12012/api/v1/",
        .Production:    "http://27.254.94.169:12012/api/v1/"
    ]}
}

extension Environment {
        
    /// Current endpoint for use.
    static var current: Environment {
        
        // Configuration
        if BundleInfo.Configuration == "Not found" {
            // Not have build configuration in main bundle.
            // Use default build configuration. (Debug and Release)
            
            /// Select host from running state
            switch Running.configuration {
                case .Debug:
                    return .Develop
                case .TestFlight:
                    return .Staging
                case .InHouse:
                    return .Production
                case .AppStore:
                    return .Production
            }
        } else {
            // Use custom build configuration.
            
            /// Select host from configuration
            switch BundleInfo.Configuration {
                case Environment.Production.name:
                    return Environment.Production
                case Environment.Staging.name:
                    return Environment.Staging
                default:
                    return Environment.Develop
            }
        }
    }
}
