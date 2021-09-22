//
//  MenuTableViewCell.swift
//  DemoNut
//
//  Created by Donut on 22/9/2564 BE.
//

import UIKit

class MenuTableViewCell: BaseTableViewCell {

    static var height: CGFloat {
        return 60
    }
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBadge: UILabel!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeFrameView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var item: MenuInfo? {
        didSet {
            self.updateInterface()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInterface()
    }
    
    func setupInterface() {
        self.frameView.setupCorner(MenuTableViewCell.height/2)
        self.badgeFrameView.setupCorner(self.badgeFrameView.frame.height/2)
    }
    
    func updateInterface() {
        
    }
 
   
}
