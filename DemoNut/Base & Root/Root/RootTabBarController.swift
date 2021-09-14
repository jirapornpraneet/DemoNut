//
//  RootTabBarController.swift
//  DemoNut
//
//  Created by Donut on 14/9/2564 BE.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    enum Tab: Int {
        case Home = 0, News, Notification, Menu
    }

    // Controllers
    private var homeViewController: UIViewController!
    private var newsViewController: UIViewController!
    private var notiViewController: UIViewController!
    private var menuViewController: UIViewController!
    
    /// List of controller
    private var listController: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialTabbar()
    }
    
    func setBadge(badge: Int, in tab: RootTabBarController.Tab) {
        if let item = self.tabBar.items?[tab.rawValue] {
        }
    }
    
    func setSelected(_ tab: RootTabBarController.Tab) {
        self.selectedIndex = tab.rawValue
    }
    
    /// Setup controller
    func initialTabbar() {
        
        let homeVC: HomeViewController = AppDirector.instantiate()
        homeViewController = RootNavigationController.init(rootViewController: homeVC)
        
        // Initial
        self.setupTabIcon()
        self.listController = [homeViewController, newsViewController, notiViewController, menuViewController]
        self.viewControllers = listController
    }
    
    func setupTabIcon() {
        
        self.tabBar.backgroundColor = .white
        
        
        // Title
        homeViewController.tabBarItem.title = "หน้าแรก"
        newsViewController.tabBarItem.title = "ข่าวสาร"
        notiViewController.tabBarItem.title = "แจ้งเตือน"
        menuViewController.tabBarItem.title = "เมนู"
        
        // Font
        let font = UIFont.Theme.primary_semibold.withSize(12)
        UITabBar.appearance().tintColor = UIColor.Theme.primary
        homeViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
        // Set icon tabbar
        homeViewController.tabBarItem.image = UIImage.Theme.ic_tabbar_home
        
        
        // homeViewController.tabBarItem.selectedImage = ...
    }
}

