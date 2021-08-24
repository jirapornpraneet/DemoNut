//
//  RootNavigationController.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class RootNavigationController: UINavigationController, UIGestureRecognizerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
        self.interactivePopGestureRecognizer?.isEnabled = true
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    /*
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }*/
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
