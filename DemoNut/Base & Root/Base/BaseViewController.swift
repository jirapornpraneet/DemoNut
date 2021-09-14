//
//  BaseViewController.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit
import Foundation

class BaseViewController: UIViewController {

    @IBOutlet weak var navigationView: UIView?
    @IBOutlet weak var navigationLabel: UILabel?
    @IBOutlet weak var navigationViewHeight: NSLayoutConstraint?
    private var tapToDismiss: UITapGestureRecognizer?
    private var emptyView: EmptyView?
    
    /// Screen height - top bar.
    var contentScreenHeight: CGFloat {
        if let _ = self.navigationView {
            return UIDevice.screenSize.height - Layout.StatusBar.height - Layout.NavigationBar.height
        }
        return UIDevice.screenSize.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.setNeedsStatusBarAppearanceUpdate()
        self.dismissKeyboard()
    }
    
    private func setupInterface() {
        self.navigationViewHeight?.constant = Layout.StatusBar.height + Layout.NavigationBar.height
        self.view.layoutIfNeeded()
    }
}


// MARK: - Keyboard

extension BaseViewController {
    
    func setupViewTapToDismissKeyboard() {
        if tapToDismiss == nil {
            tapToDismiss = UITapGestureRecognizer(target: self, action: #selector(didTappedToDismissKeyboard))
            if let tap = tapToDismiss {
                view.addGestureRecognizer(tap)
            }
        }
    }
    
    @objc func didTappedToDismissKeyboard() {
        dismissKeyboard()
    }
    
    @objc func dismissKeyboard() {
        guard let tap = tapToDismiss else { return }
        view.removeGestureRecognizer(tap)
        view.endEditing(true)
        tapToDismiss = nil
    }
    
    func setupKeyboardNotification() {
        // Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        setupViewTapToDismissKeyboard()
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        dismissKeyboard()
    }
}


// MARK: - Action

extension BaseViewController {
    
    @IBAction func logout(_ sender: Any) {
        AppDirector.sharedInstance.logout()
    }
    
    @IBAction func openDrawer(_ sender: Any) {
        let slideControl = sideMenuController!
        slideControl.showLeftView(animated: true) {
            // Todo somthing if needed.
        }
    }
    
    @IBAction func done(_ sender: Any) {
        done()
    }
    
    private func done() {
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.count <= 1 {
                self.dismiss(animated: true, completion: nil)
            } else {
                navigationController.popViewController(animated: true)
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


// MARK: - Custom View

extension BaseViewController {
    
    func addEmptyView(_ view: UIView, title: String,_ completion: (() -> ())? = nil) {
        guard let empView = self.embedEmptyView(view) else { return }
        self.emptyView = empView
        self.emptyView?.lblTitle.text = title
        self.emptyView?.onRefresh = { _ in
            self.clearEmptyView()
            completion?()
        }
    }
    
    func clearEmptyView() {
        self.emptyView?.removeFromSuperview()
        self.emptyView = nil
    }
    
    private func embedEmptyView(_ sourceView: UIView) -> EmptyView? {
        guard let emptyView = Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)?.first as? EmptyView else { return nil }
        return sourceView.embedView(emptyView) as? EmptyView
    }
}
