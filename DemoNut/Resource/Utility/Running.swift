//
//  Running.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

class Running {
    
    enum RunningConfiguration {
        case Debug
        case TestFlight
        case InHouse
        case AppStore
    }
    
    private var isDebug: Bool {
      #if DEBUG
        return true
      #else
        return false
      #endif
    }
    
    static var configuration: RunningConfiguration {
        return Running().runningEnvironment()
    }
    
    private func runningEnvironment() -> RunningConfiguration {
        if isDebug {
            return .Debug
        } else {
            if !isRunningInTestFlightEnvironment() && !isRunningInAppStoreEnvironment() {
                return .InHouse
            } else if isRunningInTestFlightEnvironment() {
                return .TestFlight
            } else {
                return .AppStore
            }
        }
    }
    
    private func isRunningInTestFlightEnvironment() -> Bool {
        if isAppStoreReceiptSandbox() && !hasEmbeddedMobileProvision() {
            return true
        } else {
            return false
        }
    }

    private func isRunningInAppStoreEnvironment() -> Bool {
        if isAppStoreReceiptSandbox() || hasEmbeddedMobileProvision() {
            return false
        } else {
            return true
        }
    }

    private func hasEmbeddedMobileProvision() -> Bool{
        if let _ = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") {
            return true
        }
        return false
    }

    private func isAppStoreReceiptSandbox() -> Bool {
        if let appStoreReceiptURL = Bundle.main.appStoreReceiptURL, appStoreReceiptURL.lastPathComponent == "sandboxReceipt" {
            return true
        }
        return false
    }
}
