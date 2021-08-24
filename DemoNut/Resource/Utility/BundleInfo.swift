//
//  BundleInfo.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

struct BundleInfo {
    
    static var Configuration: String {
        return Bundle.main.infoDictionary?["Configuration"] as? String ?? "Not found"
    }
    
    static var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier!
    }
    
    static var buildVersion: String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    static var appVersion: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    static var bundleName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    static var GoogleClientId: String {
        return Bundle.main.infoDictionary!["GoogleClientId"] as! String
    }
    static var GoogleReversedClientId: String {
        return Bundle.main.infoDictionary!["GoogleReversedClientId"] as! String
    }
    
    static var scheme: String {
        guard let urlTypes = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? [Any],
        let urlTypeDictionary = urlTypes.first as? [String: Any],
        let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [Any],
        let externalURLScheme = urlSchemes.first as? String else { return "" }
        return externalURLScheme
    }
    
    public static var localizedBundle: Bundle {
        let language = DataStore.string(forKey: Constant.Key.Store.language) ?? "th"
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        return Bundle(path: path!)!
    }
    
    public static func setLanguage(_ language: String) {
        DataStore.set(language, forKey: Constant.Key.Store.language)
        Bundle.main.path(forResource: language, ofType: "lproj")
    }
}

