//
//  UIFont+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import UIKit

extension UIFont { //++
    
    /// Font of project.
    static var Theme: AppFont = AppConfiguration.appFont
    
    /// Initial new font.
    convenience init(fontName: String, size: CGFloat) {
        self.init(name: fontName, size: size)!
    }
}
