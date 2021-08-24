//
//  AppConfiguration.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class AppConfiguration {
    
    // MARK: - Structure
    
    struct Image {
        let background: UIImage
    }
    
    struct Color {
        let primary     : UIColor
        let secondary   : UIColor
        let thirdary    : UIColor
    }
}

extension AppConfiguration {
    
    // MARK: - Theme Image
    static var appImage: Image {
        return Image(
            background: UIImage(named: "img_background")!
        )
    }
    
    // MARK: - Theme Color
    static var appColor: Color {
        return Color(
            primary:    UIColor("#000000"),
            secondary:  UIColor("#000000"),
            thirdary:   UIColor("#000000")
        )
    }
}
