//
//  MenuViewController.swift
//  DemoNut
//
//  Created by Donut on 22/9/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import UIKit

class MenuViewController : BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerTableView: UIView!
    var viewModel = MenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateInterface()
    }
    
    func updateInterface() {
        tableView.reloadData()
    }
    
    @objc func didUpdateApproveBadge() {
        self.updateInterface()
    }
}

extension MenuViewController {
    
    func fetchMenu() {
        viewModel.fetchMenu {
            self.updateInterface()
        }
    }
}


extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenuTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier, for: indexPath) as! MenuTableViewCell
        cell.item = viewModel.menuList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        didSelectedMenu(viewModel.menuList[indexPath.row].item)
        self.perform(0.4, success: {
            tableView.deselectRow(at: indexPath, animated: true)
        })
    }
}
