//
//  ReuseIdentifying.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import UIKit

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UIViewController: ReuseIdentifying {}

extension UITableViewCell: ReuseIdentifying {}

extension UICollectionViewCell: ReuseIdentifying {}

extension UITableViewHeaderFooterView: ReuseIdentifying {}

extension UICollectionReusableView: ReuseIdentifying {}
