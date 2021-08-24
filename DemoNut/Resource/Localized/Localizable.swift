//
//  Localizable.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import UIKit

// Protocal
protocol Localizable {
    var localized: String { get }
}


// IBInspectable

class LocalizableLabel: UILabel {
    @IBInspectable var key: String?
}

class LocalizableButton: UIButton {
    @IBInspectable var keyDefault: String?
    @IBInspectable var keyHighlighted: String?
    @IBInspectable var keySelected: String?
    @IBInspectable var keyDisabled: String?
}

class LocalizableTextField: UITextField {
    @IBInspectable var key: String?
}

class LocalizableTextView: UITextView {
    @IBInspectable var key: String?
}

class LocalizableSearchBar: UISearchBar {
    @IBInspectable var key: String?
}
