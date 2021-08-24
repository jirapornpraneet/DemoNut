//
//  Size.swift
//  DemoNut
//
//  Created On 24/8/2564 BE.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

public extension UIDevice {
    enum Model : String {
        case simulator     = "simulator/sandbox",
        
        //iPod
        iPod1              = "iPod 1",
        iPod2              = "iPod 2",
        iPod3              = "iPod 3",
        iPod4              = "iPod 4",
        iPod5              = "iPod 5",
        iPod6              = "iPod 6",
        
        //iPad
        iPad2              = "iPad 2",
        iPad3              = "iPad 3",
        iPad4              = "iPad 4",
        iPad5              = "iPad 5", //aka iPad 2017
        iPad6              = "iPad 6", //aka iPad 2018
        iPad7              = "iPad 7", //aka iPad 2019
        
        //iPad Air
        iPadAir            = "iPad Air ",
        iPadAir2           = "iPad Air 2",
        iPadAir3           = "iPad Air 3",
        
        //iPad mini
        iPadMini           = "iPad Mini",
        iPadMini2          = "iPad Mini 2",
        iPadMini3          = "iPad Mini 3",
        iPadMini4          = "iPad Mini 4",
        iPadMini5          = "iPad Mini 5",
        
        //iPad pro
        iPadPro9_7Inch        = "iPad Pro 9.7\"",
        iPadPro10_5Inch       = "iPad Pro 10.5\"",
        
        iPadPro11_0Inch       = "iPad Pro 11.0\"",
        iPadPro11_0Inch2      = "iPad Pro 11.0\" Gen 2",
        
        iPadPro12_9Inch       = "iPad Pro 12.9\"",
        iPadPro12_9Inch2      = "iPad Pro 12.9\" Gen 2",
        iPadPro12_9Inch3      = "iPad Pro 12.9\" Gen 3",
        iPadPro12_9Inch4      = "iPad Pro 12.9\" Gen 4",
        
        //iPhone
        iPhone4            = "iPhone 4",
        iPhone4S           = "iPhone 4S",
        iPhone5            = "iPhone 5",
        iPhone5S           = "iPhone 5S",
        iPhone5C           = "iPhone 5C",
        iPhone6            = "iPhone 6",
        iPhone6Plus        = "iPhone 6 Plus",
        iPhone6S           = "iPhone 6S",
        iPhone6SPlus       = "iPhone 6S Plus",
        iPhoneSE           = "iPhone SE",
        iPhone7            = "iPhone 7",
        iPhone7Plus        = "iPhone 7 Plus",
        iPhone8            = "iPhone 8",
        iPhone8Plus        = "iPhone 8 Plus",
        iPhoneX            = "iPhone X",
        iPhoneXS           = "iPhone XS",
        iPhoneXSMax        = "iPhone XS Max",
        iPhoneXR           = "iPhone XR",
        iPhone11           = "iPhone 11",
        iPhone11Pro        = "iPhone 11 Pro",
        iPhone11ProMax     = "iPhone 11 Pro Max",
        iPhoneSE2          = "iPhone SE 2",
        
        //Apple TV
        AppleTV            = "Apple TV",
        AppleTV2           = "Apple TV 2",
        AppleTV3           = "Apple TV 3",
        AppleTV4           = "Apple TV 4",
        AppleTV_4K         = "Apple TV 4K",
        unrecognized       = "?unrecognized?"
    }
}

public enum Size: Int, Comparable {
    case unknownSize = 0
    #if os(iOS)
    /// iPhone 4, 4s, iPod Touch 4th gen.
    case screen3_5Inch
    /// iPhone 5, 5s, 5c, SE, iPod Touch 5-6th gen.
    case screen4Inch
    /// iPhone 6, 6s, 7, 8
    case screen4_7Inch
    /// iPhone 6+, 6s+, 7+, 8+
    case screen5_5Inch
    /// iPhone X, Xs, 11 Pro
    case screen5_8Inch
    /// iPhone Xr, 11
    case screen6_1Inch
    /// iPhone Xs Max, 11 Pro Max
    case screen6_5Inch
    /// iPad Mini
    case screen7_9Inch
    /// iPad
    case screen9_7Inch
    /// iPad (10.2-inch)
    case screen10_2Inch
    /// iPad Pro (10.5-inch)
    case screen10_5Inch
    /// iPad Pro (11-inch)
    case screen11Inch
    /// iPad Pro (12.9-inch)
    case screen12_9Inch
    #elseif os(OSX)
    case screen11Inch
    case screen12Inch
    case screen13Inch
    case screen15Inch
    case screen17Inch
    case screen20Inch
    case screen21_5Inch
    case screen24Inch
    case screen27Inch
    #endif
}

public func <(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func ==(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
