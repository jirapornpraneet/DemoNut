//
//  MenuViewController+View.swift
//  DemoNut
//
//  Created by Donut on 22/9/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

extension MenuViewController {
    
    func setupView() {
        self.view.backgroundColor = UIColor.Theme.primary
        self.navigationViewHeight?.constant = Layout.StatusBar.height
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.alwaysBounceVertical = false
        
        headerTableView.frame.size.height = 100
        tableView.tableHeaderView = headerTableView
        
        /// Register
        let nibCell = UINib(nibName: "MenuTableViewCell", bundle: Bundle(for: MenuTableViewCell.self))
        self.tableView.register(nibCell, forCellReuseIdentifier: "MenuTableViewCell")
    }
}
