//
//  HomeViewController.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class HomeViewController : BaseViewController {
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func updateInterface() {
        // Code here to update your interface
    }
}

extension HomeViewController {
    
    func fetchData() {
        viewModel.requestData {
            // On fetch success
        }
    }
}
