//
//  UIView+Extension.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import ObjectiveC
import QuartzCore
import UIKit

extension UIView {
    
    //private var activityIndicatorKey: UInt8 = 0
    struct AssociatedKey {
        static var activityIndicatorKey = "activity.Indicator"
    }
    
    private var activityIndicatorView: UIActivityIndicatorView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.activityIndicatorKey ) as! UIActivityIndicatorView?
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.activityIndicatorKey,  newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var activityIndicator: UIActivityIndicatorView {
        
        guard let actView = activityIndicatorView else {
            
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            //activityIndicator.center = self.center
            
            activityIndicator.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = .gray
            
            self.activityIndicatorView = activityIndicator
            return activityIndicator
        }
        return actView
    }
    
    func showActivityIndicator() {
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
    
    /// Localize all subviews.
    
    func localizedView() {
        for view in self.subviews {
            
            // Label
            if let label = view as? LocalizableLabel {
                label.text = label.key?.localized ?? label.text
            }

            // Button
            if let button = view as? LocalizableButton {
                button.setTitle(button.keyDefault?.localized ?? button.title(for: .normal), for: .normal)
                button.setTitle(button.keyDisabled?.localized ?? button.title(for: .disabled), for: .disabled)
                button.setTitle(button.keySelected?.localized ?? button.title(for: .selected), for: .selected)
                button.setTitle(button.keyHighlighted?.localized ?? button.title(for: .highlighted), for: .highlighted)
            }

            // Textfield
            if let textField = view as? LocalizableTextField {
                textField.placeholder = textField.key?.localized
            }
            
            // Textview
            if let textView = view as? LocalizableTextView {
                textView.text = textView.key?.localized
            }
            
            // Search bar
            if let searchBar = view as? LocalizableSearchBar {
                searchBar.placeholder = searchBar.key?.localized
            }
            
            // Recursive all.
            view.localizedView()
        }
    }
}


// MARK: - Interface Style

extension UIView {
    
    func setupCorner(_ radius: CGFloat = Layout.Corner.radius) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setupBorder(_ color: UIColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1), width: CGFloat = Layout.Border.width) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }

    func setupCircle() {
        self.setupCorner(self.frame.size.width/2)
    }
    
    func setupCardStyle(_ shadowRadius: CGFloat = Layout.Shadow.radius,_ cornerRadius: CGFloat = Layout.Corner.radius) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 0.5
    }
    
    func rounded(corners: UIRectCorner, cornerRadius: Double) {
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}


// MARK: - Action/Animation

extension UIView {
    
    /// Capture view to UIImage.
    func screenshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    /// Fade out with duretion.
    func fadeOut(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    /// Fade in with duretion.
    func fadeIn(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /// Animation on press ui.
    func press(completion:((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.05, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) }, completion: { (finish: Bool) in
                UIView.animate(withDuration: 0.1, animations: {
                    self.transform = CGAffineTransform.identity
                    completion?(finish)
                })
        })
    }
    
    /// Animation Y.
    func animateTranformTranslationY(_ value: CGFloat = 0, _ completion: (() -> ())? = nil) {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: value)
        }) { _ in
            completion?()
        }
    }
}


// MARK: - Embed

extension UIView {
       
    /// Embed UIView to UIView.
    func embedView(_ contentView: UIView) -> UIView? {
       self.addSubview(contentView)
        self.sendSubviewToBack(contentView)
        
       // Layout Constraint
       contentView.translatesAutoresizingMaskIntoConstraints = false
       let horizontalConstraint = contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
       let verticalConstraint = contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
       let widthConstraint = contentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1)
       let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1)
       self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
       return contentView
    }
    
    /// Remove all subviews.
    func removeAllSubviews() {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
}

/*
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = shadowRadius
        }
    }
}*/

