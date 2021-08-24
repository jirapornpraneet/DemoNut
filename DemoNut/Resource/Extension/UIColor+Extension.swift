//
//  UIColor+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import  UIKit

extension UIColor {
    
    /// Color of project.
    static var Theme: AppColor = AppConfiguration.appColor
    
    // Initial with integer
    convenience init(red: Int, green: Int, blue: Int) {
        let r = CGFloat(red)/255
        let g = CGFloat(green)/255
        let b = CGFloat(blue)/255
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    // Default
    struct Flat {
        struct Green {
            static let MountainMeadow = UIColor(hex8: 0x3ABB9D)
            static let ChateauGreen = UIColor(hex8: 0x4DA664)
            static let PersianGreen = UIColor(hex8: 0x2CA786)
        }
        
        struct Blue {
            static let PictonBlue = UIColor(hex8: 0x5CADCF)
            static let Mariner = UIColor(hex8: 0x3585C5)
            static let CuriousBlue = UIColor(hex8: 0x4590B6)
            static let Denim = UIColor(hex8: 0x2F6CAD)
            static let Chambray = UIColor(hex8: 0x485675)
            static let BlueWhale = UIColor(hex8: 0x29334D)
        }
        
        struct Violet {
            static let Wisteria = UIColor(hex8: 0x9069B5)
            static let BlueGem = UIColor(hex8: 0x533D7F)
        }
        
        struct Yellow {
            static let Energy = UIColor(hex8: 0xF2D46F)
            static let Turbo = UIColor(hex8: 0xF7C23E)
        }
        
        struct Orange {
            static let NeonCarrot = UIColor(hex8: 0xF79E3D)
            static let Sun = UIColor(hex8: 0xEE7841)
        }
        
        struct Red {
            static let TerraCotta = UIColor(hex8: 0xE66B5B)
            static let Valencia = UIColor(hex8: 0xCC4846)
            static let Cinnabar = UIColor(hex8: 0xDC5047)
            static let WellRead = UIColor(hex8: 0xB33234)
        }
        
        struct Gray {
            static let AlmondFrost = UIColor(hex8: 0xA28F85)
            static let WhiteSmoke = UIColor(hex8: 0xEFEFEF)
            static let Iron = UIColor(hex8: 0xD1D5D8)
            static let IronGray = UIColor(hex8: 0x75706B)
        }
    }
}
