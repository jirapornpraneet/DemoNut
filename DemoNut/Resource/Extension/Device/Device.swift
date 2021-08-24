//
//  Device.swift
//  DemoNut
//
//  Created On 24/8/2564 BE.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit
import Foundation
import SystemConfiguration.CaptiveNetwork

extension UIDevice {
    
    struct NetworkInfo {
        public let interface:String
        public let ssid:String
        public let bssid:String
        init(_ interface:String, _ ssid:String,_ bssid:String) {
            self.interface = interface
            self.ssid = ssid
            self.bssid = bssid
        }
    }
    
    static var WiFiSSID: String? {
        guard let interfaces = CNCopySupportedInterfaces() as? [String] else { return nil }
        let key = kCNNetworkInfoKeySSID as String
        for interface in interfaces {
            guard let interfaceInfo = CNCopyCurrentNetworkInfo(interface as CFString) as NSDictionary? else { continue }
            return interfaceInfo[key] as? String
        }
        return nil
    }
    
    static var networkInfo: [NetworkInfo] {
        // https://forums.developer.apple.com/thread/50302
        guard let interfaceNames = CNCopySupportedInterfaces() as? [String] else {
            return []
        }
        
        let networkInfos:[NetworkInfo] = interfaceNames.compactMap{ name in
            guard let info = CNCopyCurrentNetworkInfo(name as CFString) as? [String:AnyObject] else {
                return nil
            }
            guard let ssid = info[kCNNetworkInfoKeySSID as String] as? String else {
                return nil
            }
            guard let bssid = info[kCNNetworkInfoKeyBSSID as String] as? String else {
                return nil
            }
            return NetworkInfo(name, ssid,bssid)
        }
        return networkInfos
    }
}

public extension UIDevice {
    
    var model: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        let modelMap : [ String : Model ] = [
            "i386"      : .simulator,
            "x86_64"    : .simulator,
            
            //iPod
            "iPod1,1"   : .iPod1,
            "iPod2,1"   : .iPod2,
            "iPod3,1"   : .iPod3,
            "iPod4,1"   : .iPod4,
            "iPod5,1"   : .iPod5,
            
            //iPad
            "iPad2,1"   : .iPad2,
            "iPad2,2"   : .iPad2,
            "iPad2,3"   : .iPad2,
            "iPad2,4"   : .iPad2,
            "iPad3,1"   : .iPad3,
            "iPad3,2"   : .iPad3,
            "iPad3,3"   : .iPad3,
            "iPad3,4"   : .iPad4,
            "iPad3,5"   : .iPad4,
            "iPad3,6"   : .iPad4,
            "iPad6,11"  : .iPad5, //aka iPad 2017
            "iPad6,12"  : .iPad5,
            "iPad7,5"   : .iPad6, //aka iPad 2018
            "iPad7,6"   : .iPad6,
            "iPad7,11"  : .iPad7, //aka iPad 2019
            "iPad7,12"  : .iPad7,
            
            //iPad Air
            "iPad4,1"   : .iPadAir,
            "iPad4,2"   : .iPadAir,
            "iPad4,3"   : .iPadAir,
            "iPad5,3"   : .iPadAir2,
            "iPad5,4"   : .iPadAir2,
            "iPad11,3"  : .iPadAir3,
            "iPad11,4"  : .iPadAir3,
            
            //iPad mini
            "iPad2,5"   : .iPadMini,
            "iPad2,6"   : .iPadMini,
            "iPad2,7"   : .iPadMini,
            "iPad4,4"   : .iPadMini2,
            "iPad4,5"   : .iPadMini2,
            "iPad4,6"   : .iPadMini2,
            "iPad4,7"   : .iPadMini3,
            "iPad4,8"   : .iPadMini3,
            "iPad4,9"   : .iPadMini3,
            "iPad5,1"   : .iPadMini4,
            "iPad5,2"   : .iPadMini4,
            "iPad11,1"  : .iPadMini5,
            "iPad11,2"  : .iPadMini5,
            
            //iPad pro
            "iPad6,3"   : .iPadPro9_7Inch,
            "iPad6,4"   : .iPadPro9_7Inch,
            "iPad7,3"   : .iPadPro10_5Inch,
            "iPad7,4"   : .iPadPro10_5Inch,
            
            "iPad8,1"   : .iPadPro11_0Inch,
            "iPad8,2"   : .iPadPro11_0Inch,
            "iPad8,3"   : .iPadPro11_0Inch,
            "iPad8,4"   : .iPadPro11_0Inch,
            "iPad8,9"   : .iPadPro11_0Inch2,
            "iPad8,10"  : .iPadPro11_0Inch2,
            
            "iPad6,7"   : .iPadPro12_9Inch,
            "iPad6,8"   : .iPadPro12_9Inch,
            "iPad7,1"   : .iPadPro12_9Inch2,
            "iPad7,2"   : .iPadPro12_9Inch2,
            "iPad8,5"   : .iPadPro12_9Inch3,
            "iPad8,6"   : .iPadPro12_9Inch3,
            "iPad8,7"   : .iPadPro12_9Inch3,
            "iPad8,8"   : .iPadPro12_9Inch3,
            "iPad8,11"  : .iPadPro12_9Inch4,
            "iPad8,12"  : .iPadPro12_9Inch4,
            
            //iPhone
            "iPhone3,1" : .iPhone4,
            "iPhone3,2" : .iPhone4,
            "iPhone3,3" : .iPhone4,
            "iPhone4,1" : .iPhone4S,
            "iPhone5,1" : .iPhone5,
            "iPhone5,2" : .iPhone5,
            "iPhone5,3" : .iPhone5C,
            "iPhone5,4" : .iPhone5C,
            "iPhone6,1" : .iPhone5S,
            "iPhone6,2" : .iPhone5S,
            "iPhone7,1" : .iPhone6Plus,
            "iPhone7,2" : .iPhone6,
            "iPhone8,1" : .iPhone6S,
            "iPhone8,2" : .iPhone6SPlus,
            "iPhone8,4" : .iPhoneSE,
            "iPhone9,1" : .iPhone7,
            "iPhone9,3" : .iPhone7,
            "iPhone9,2" : .iPhone7Plus,
            "iPhone9,4" : .iPhone7Plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,4" : .iPhone8,
            "iPhone10,2" : .iPhone8Plus,
            "iPhone10,5" : .iPhone8Plus,
            "iPhone10,3" : .iPhoneX,
            "iPhone10,6" : .iPhoneX,
            "iPhone11,2" : .iPhoneXS,
            "iPhone11,4" : .iPhoneXSMax,
            "iPhone11,6" : .iPhoneXSMax,
            "iPhone11,8" : .iPhoneXR,
            "iPhone12,1" : .iPhone11,
            "iPhone12,3" : .iPhone11Pro,
            "iPhone12,5" : .iPhone11ProMax,
            "iPhone12,8" : .iPhoneSE2,
            
            //AppleTV
            "AppleTV2,1" : .AppleTV2,
            "AppleTV3,1" : .AppleTV3,
            "AppleTV3,2" : .AppleTV3,
            "AppleTV5,3" : .AppleTV4,
            "AppleTV6,2" : .AppleTV_4K
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            if model == .simulator {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!] {
                        return simModel
                    }
                }
            }
            return model
        }
        return Model.unrecognized
    }
    
    static var size: Size {
        
        let w: Double = Double(UIDevice.screenSize.width)
        let h: Double = Double(UIDevice.screenSize.height)
        let screenHeight: Double = max(w, h)
        
        switch screenHeight {
            case 480:
                return .screen3_5Inch
            case 568:
                return .screen4Inch
            case 667:
                return UIScreen.main.scale == 3.0 ? .screen5_5Inch : .screen4_7Inch
            case 736:
                return .screen5_5Inch
            case 812:
                return .screen5_8Inch
            case 896:
                switch UIDevice.model {
                    case .iPhoneXSMax, .iPhone11ProMax:
                        return .screen6_5Inch
                    default:
                        return .screen6_1Inch // Xr, 11
                }
            case 1024:
                switch UIDevice.model {
                    case .iPadMini,.iPadMini2,.iPadMini3,.iPadMini4,.iPadMini5:
                        return .screen7_9Inch
                    case .iPadPro10_5Inch:
                        return .screen10_5Inch
                    default:
                        return .screen9_7Inch // iPad & iPad Air
                }
            case 1080:
                return .screen10_2Inch
            case 1112:
                return .screen10_5Inch
            case 1194:
                return .screen11Inch
            case 1366:
                return .screen12_9Inch
            default:
                return .unknownSize
        }
    }
    
}

extension UIDevice {
    
    var iOSVersion: String {
        return UIDevice.current.systemVersion
    }

    static var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    static var model: UIDevice.Model {
        return UIDevice().model
    }
    
    // Device Orientation

    var isPortrait: Bool {
        return UIDevice.current.orientation.isPortrait
    }

    var isLandscape: Bool {
        return UIDevice.current.orientation.isLandscape
    }

    // Device Family

    static var isPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }

    static var isPad: Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }

    static var isAppleTV: Bool {
        return UIDevice().userInterfaceIdiom == .tv
    }

    // Running On

    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }

    /// For all devices of iPhone X, 11 (Curved screen.)
    static var isCurvedSeries: Bool {
        return UIDevice.size == .screen5_8Inch
            || UIDevice.size == .screen6_1Inch
            || UIDevice.size == .screen6_5Inch
    }
    
    // One device series
    
    /// For devices like iPhone 5, 5s, 5c, SE
    static var is5Series: Bool {
        return UIDevice.size == .screen4Inch
    }
    
    /// For devices like iPhone 6, 6S, 7, 8, SE 2
    static var is8Series: Bool {
        return UIDevice.size == .screen4_7Inch
    }
    
    /// For devices like iPhone 6+, 6S+, 7+, 8+
    static var is8PlusSeries: Bool {
        return UIDevice.size == .screen5_5Inch
    }
}
