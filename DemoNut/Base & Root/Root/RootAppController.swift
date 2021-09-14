//
//  RootAppController.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class RootAppController: LGSideMenuController {
    
    var mainController: UIViewController!
    var statusbarStyle = UIStatusBarStyle.lightContent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupStyle()
        AppDirector.sharedInstance.rootController = self
        
        // กรณีมี Tabbar
//        self.mainController = RootTabBarController()
//        self.enableMenu(false)
        
        //กรณีไม่มี Tabbar
        let homeController: HomeViewController = AppDirector.instantiate()
        self.mainController = RootNavigationController(rootViewController: homeController)
        
        self.rootViewController = mainController
        self.delegate = self
    }
    
    func setRoot() {
        // Todo somthing.
    }
    
    func setStatusBar(_ style: UIStatusBarStyle = .lightContent) {
        self.statusbarStyle = style
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return statusbarStyle
    }
}


// MARK: - Interface

extension RootAppController {
    
    /// Set tabbar
    func setTabbar(_ tab: RootTabBarController.Tab) {
        if let tabbar: RootTabBarController = self.mainController as? RootTabBarController {
            tabbar.setSelected(tab)
        }
    }
    
    func setTabbar(badge: Int,in tab: RootTabBarController.Tab) {
        if let tabbar: RootTabBarController = self.mainController as? RootTabBarController {
            tabbar.setBadge(badge: badge, in: tab)
        }
    }

    
    /// Turn on or off menu
    func enableMenu(_ isEnabled: Bool = true) {
        self.isLeftViewEnabled = isEnabled
        self.isRightViewEnabled = isEnabled
    }
    
    /// Turn on or off gesture for present drawer.
    func setMenuSwipeGesture(_ isEnabled: Bool = true) {
        self.isLeftViewSwipeGestureEnabled = isEnabled
        self.isRightViewSwipeGestureEnabled = isEnabled
    }
    
    func setupStyle() {
        self.leftViewPresentationStyle = .slideAbove
        self.leftViewCoverAlpha = 1
        
        leftViewWidth = Layout.Constant.drawerWidth
        leftViewStatusBarStyle = .default
        rootViewCoverColorForLeftView = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
    }
    
    override func leftViewWillLayoutSubviews(with size: CGSize) {
        super.leftViewWillLayoutSubviews(with: size)
        if !isLeftViewStatusBarHidden {
            leftView?.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        }
    }
}

extension RootAppController: LGSideMenuDelegate {
    
    // Left Menu Delegate
    
    func didShowLeftView(_ leftView: UIView, sideMenuController: LGSideMenuController) {
        // Todo somthing.
    }
    
    func willShowLeftView(_ leftView: UIView, sideMenuController: LGSideMenuController) {
        // Todo somthing.
    }
    
    func willHideLeftView(_ leftView: UIView, sideMenuController: LGSideMenuController) {
        // Todo somthing.
    }
}
