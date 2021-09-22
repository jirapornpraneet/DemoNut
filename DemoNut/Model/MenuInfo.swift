//
//  MenuInfo.swift
//  DemoNut
//
//  Created by Donut on 22/9/2564 BE.
//

import Foundation

class MenuInfo: BaseInfo {
    
    enum MenuItem: Int, CaseIterable {
        case Home = 0, Profilem, Approval, Stamp, OT, Leave, Calendar, News, Logout
    }

    var item: MenuItem = .Home
    
    init(title: String, icon: UIImage, menu: MenuInfo.MenuItem) {
        super.init()
        self.title = title
        self.image = icon
        self.item = menu
    }
}
