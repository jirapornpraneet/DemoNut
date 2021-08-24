//
//  DrawerViewController.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class DrawerViewController : BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = DrawerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func updateInterface() {
        // Code here to update your interface
    }
}

extension DrawerViewController {
    
    func fetchData() {
        viewModel.requestData {
            // On fetch success
        }
    }
}
