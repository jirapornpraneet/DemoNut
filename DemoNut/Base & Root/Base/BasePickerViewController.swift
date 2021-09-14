//
//  BasePickerViewController.swift
//  DemoNut
//
//  Created by Donut on 14/9/2564 BE.
//

import UIKit
import PanModal

class BasePickerViewController : BaseViewController {
    
    var minimumHeight: CGFloat {
        return UIDevice.screenSize.height * Layout.Picker.min_scale
    }
    
    var maximumHeight: CGFloat {
        return UIDevice.screenSize.height * Layout.Picker.max_scale
    }
    
    var pickerHeight: CGFloat {
        return minimumHeight
    }
    
    var headerHeight: CGFloat {
        return Layout.Picker.section_height
    }
    
    var bottomHeight: CGFloat {
        return Layout.Picker.bottom_height
    }
    
    private var contentHeight: CGFloat {
        return pickerHeight - Layout.BottomBar.height
    }
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pickerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnConfirm: UIButton?
    @IBOutlet weak var bottomView: UIView?

    var onDismiss: (()->())?
    var pickerTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInterface()
    }
    
    func setupInterface() {
        navigationLabel?.text = pickerTitle
        btnConfirm?.setupCorner(Layout.Corner.radius)
        btnConfirm?.setupBorder(.lightGray, width: 1)
        pickerViewHeight.constant = contentHeight
        headerViewHeight.constant = headerHeight
        bottomViewHeight.constant = bottomHeight
        self.view.layoutIfNeeded()
    }
    
    func updateInterface() {
        // Code here to update your interface
    }
}

extension BasePickerViewController {
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension BasePickerViewController: PanModalPresentable {
    
    var allowsExtendedPanScrolling: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeightIgnoringSafeArea(maximumHeight + Layout.Constant.gap)
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeightIgnoringSafeArea(minimumHeight + Layout.Constant.gap)
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
    
    var isHapticFeedbackEnabled: Bool {
        return false
    }
    
    var showDragIndicator: Bool {
        return false
    }
    
    /*
    var isPanScrollEnabled: Bool {
        return true
    }
    
    var allowsDragToDismiss: Bool {
        return true
    }
    
    var allowsExtendedPanScrolling: Bool {
        return false
    }*/
    
    func shouldRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return false
    }
    
    func panModalWillDismiss() {
        self.onDismiss?()
    }
}
