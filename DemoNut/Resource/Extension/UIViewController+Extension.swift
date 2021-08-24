//
//  UIViewController+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import UIKit

extension UIViewController {
    
    var standardDurationAnimation: CGFloat {
        return 0.2
    }
    
    public func perform(_ afterDelay: Double, success: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + afterDelay) {
            success()
        }
    }
    
    func embed(_ controller: UIViewController, sourceView: UIView) {
        
        //add as a childviewcontroller
        self.addChild(controller)
        
        // Add the child's View as a subview
        sourceView.addSubview(controller.view)
        controller.view.frame = sourceView.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // tell the childviewcontroller it's contained in it's parent
        controller.didMove(toParent: self)
    }
    
    func hideView(with view: UIView, animated: Bool = false) {
        
        let duration = animated ? standardDurationAnimation : 0
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            view.alpha = 0
        }) { (success) in
            view.isHidden = true
        }
    }
    
    func showView(with view: UIView, animated: Bool = true) {
        
        //view.alpha = 0
        view.isHidden = false
        let duration = animated ? standardDurationAnimation : 0
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            view.alpha = 1
        }) { (success) in
            view.isHidden = false
        }
    }
}

