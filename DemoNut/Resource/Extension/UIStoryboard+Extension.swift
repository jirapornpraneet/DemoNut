//
//  UIStoryboard+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

extension UIStoryboard {
    
    /// The uniform place where we state all the storyboard we have in our application
    enum Storyboard: String, CaseIterable {
        case Root
        case Main
        case Home
        case Menu
        //case SplashScreen
        
        var filename: String {
            return rawValue
        }
        
        static var list: [Storyboard] {
            return Storyboard.allCases
        }
    }
    
    // MARK: - Convenience Initializers
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    // MARK: - Class Functions
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    // MARK: - View Controller Instantiation from Generics
    func instantiateViewController<T: UIViewController>() -> T {
        
        guard let viewController = self.instantiateViewController(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.reuseIdentifier) ")
        }
        return viewController
    }
    
    // "identifierToNibNameMap" – dont change it. It is a key for searching IDs
    func instantiateVC<T: UIViewController>(withIdentifier identifier: String) -> T? {
        
        if let identifiersList = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
            if identifiersList[identifier] != nil {
                return self.instantiateViewController(withIdentifier: identifier) as? T
            }
        }
        return nil
    }
}
