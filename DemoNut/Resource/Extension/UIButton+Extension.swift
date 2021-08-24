//
//  UIButton+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation

extension UIButton { //++
    
    /// Set title and make to like button holding.
    func setTitle(_ isHolder : Bool = true, title: String) {
        self.setTitle(title, for: self.state)
        self.setHolder(isHolder)
    }
    
    /// Make button like holding with color.
    func setHolder(_ isHolder : Bool = true, holderColor: UIColor = UIColor.lightGray) {
        self.setTitleColor(isHolder ? holderColor: .black, for: .normal)
    }
    
    /// Set selected with background color.
    func setSelected(_ isSelected: Bool, bgColor: UIColor) {
        self.isSelected = isSelected
        self.backgroundColor = bgColor
    }
}
