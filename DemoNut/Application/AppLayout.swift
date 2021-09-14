//
//  AppLayout.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import UIKit

private var kSTDStatusBarHeigt: CGFloat = 20.0 // not change!
private var kSTDSafeAreaInsets: UIEdgeInsets {
    var insets: UIEdgeInsets = UIEdgeInsets(top: kSTDStatusBarHeigt, left: 0, bottom: 0, right: 0)
    if #available(iOS 11.0, *) {
        if UIDevice.isCurvedSeries {
            let window = UIApplication.shared.windows[0]
            insets.top = window.safeAreaInsets.top
            insets.bottom = window.safeAreaInsets.bottom
        }
    }
    return insets
}


// MARK: - Size + UI

class Layout {
    
    /// All constant layout.
    
    struct Constant {
        static let gap          : CGFloat = 10.0
        static let drawerWidth  : CGFloat = 220
    }
    
    // Separated by element
    
    struct Border {
        static let width: CGFloat = 2
    }
    
    struct Corner {
        static let radius: CGFloat = 4
    }
    
    struct Shadow {
        static let radius: CGFloat = 2
    }
    
    struct Popup {
        static let scale: CGFloat = 0.3
    }
    
    // Separated by UI
    
    struct SafeArea {
        static let insets = kSTDSafeAreaInsets
    }
    
    struct StatusBar {
        static let height = Layout.SafeArea.insets.top
    }
    
    struct BottomBar {
        static let height = Layout.SafeArea.insets.bottom
    }
    
    struct NavigationBar {
        static let height: CGFloat = 50.0
    }
    
    struct Picker {
        static let scale            : CGFloat = 0.3
        static let max_scale        : CGFloat = 0.7
        static let min_scale        : CGFloat = 0.4
        static let height           : CGFloat = UIDevice.screenSize.height * Layout.Picker.scale
        static let section_height   : CGFloat = 60
        static let bottom_height    : CGFloat = 50
    }
}
