//
//  EmptyView.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class EmptyView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnRefresh: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    var onRefresh: ((_ refresh: Bool)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reloadInterface() {
        // Interface code
    }
    
    @IBAction func refreshAction(_ sender: UIButton) {
        //sender.press()
        self.onRefresh?(true)
    }
}
