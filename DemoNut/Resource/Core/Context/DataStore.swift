//
//  DataStore.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

/// Store all data type in UserDefaults

class DataStore {
    
    // MARK: - Load Data
    static func bool(forKey key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func string(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    static func float(forKey key: String) -> Float {
        return UserDefaults.standard.float(forKey: key)
    }
    
    static func int(forKey key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func array(forKey key: String) -> [Any]? {
        return UserDefaults.standard.array(forKey: key)
    }
    
    static func stringArray(forKey key: String) -> [String]? {
        return UserDefaults.standard.stringArray(forKey: key)
    }
    
    static func object(forKey key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    // MARK: - Save Data
    static func set(_ value: Any?, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    // MARK: - Clear Data
    static func remove(forKey key: String) {
        UserDefaults.standard.set(nil, forKey: key)
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
