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
        let ic_tabbar_home: UIImage
        let ic_tabbar_menu  : UIImage
    }
    
    struct Color {
        let primary     : UIColor
        let secondary   : UIColor
        let thirdary    : UIColor
    }
    
    struct Font {
        let primary_normal  : UIFont
        let primary_bold    : UIFont
        let primary_medium  : UIFont
        let primary_semibold: UIFont
    }
}

extension AppConfiguration {
    
    // MARK: - Theme Image
    static var appImage: Image {
        return Image(
            ic_tabbar_home: #imageLiteral(resourceName: "ic_tabbar_home"),
            ic_tabbar_menu: #imageLiteral(resourceName: "ic_tabbar_menu")
        )
    }
    
    // MARK: - Theme Color
    static var appColor: Color {
        return Color(
            primary:    #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),
            secondary:  UIColor("#000000"),
            thirdary:   UIColor("#000000")
        )
    }
    
    // MARK: - Theme Font
    static var appFont: Font {
        return Font(
            primary_normal  : UIFont(name: "SukhumvitSet-Text",     size: 16)!,
            primary_bold    : UIFont(name: "SukhumvitSet-Bold",     size: 16)!,
            primary_medium  : UIFont(name: "SukhumvitSet-Medium",   size: 16)!,
            primary_semibold: UIFont(name: "SukhumvitSet-SemiBold", size: 16)!
        )
    }
}
