//
//  MenuViewModel.swift
//  DemoNut
//
//  Created by Donut on 22/9/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class MenuViewModel {
    
    struct Sender {
        var id: Int
    }
    
    /// Variable Sender
    var sender: Sender?
    var menuList = [MenuInfo]()
    
    // Code here to create your view model
}

extension MenuViewModel {

    func fetchMenu(_ completion: (() -> ())? = nil) {
        
        menuList.append(MenuInfo(title: "หน้าแรก",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .Home))
        
        menuList.append(MenuInfo(title: "ข้อมูลส่วนตัว",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .Profilem))
        
        menuList.append(MenuInfo(title: "ประวัติการลงเวลาปฏิบัติงาน",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .Stamp))
        
        menuList.append(MenuInfo(title: "การทำงานล่วงเวลา (OT)",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .OT))
        
        menuList.append(MenuInfo(title: "การลา",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .Leave))
        
        menuList.append(MenuInfo(title: "ปฏิทิน",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .Calendar))
        
        menuList.append(MenuInfo(title: "ข่าวสารองค์กร",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .News))
        
        menuList.append(MenuInfo(title: "ออกจากระบบ",
                                 icon: UIImage.Theme.ic_tabbar_home,
                                 menu: .Logout))
        
        completion?()
    }
}
