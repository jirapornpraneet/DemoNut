//
//  AppDirector.swift
//  DemoNut
//
//  Created by Donut on 24/8/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//  Template file by Nuttawut Wanitchasiri (UnRafe)
//

import Foundation
import UIKit

class AppDirector {
    
    static let sharedInstance = AppDirector()
    
    // Storyboard
    private static let rootBoard: UIStoryboard = UIStoryboard(storyboard: .Root)
    private static let mainBoard: UIStoryboard = UIStoryboard(storyboard: .Main)
    private static let homeBoard: UIStoryboard = UIStoryboard(storyboard: .Home)
    private var _rootController: RootAppController!
    
    enum TransitionType {
        case Present(animated: Bool), Push(animated: Bool)
        case `default`
    }
    
    /// Controller on top
    static var topViewController: UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    static var hasPresentedViewController: Bool {
        guard let _ = AppDirector.topViewController as? RootAppController else { return true }
        return false
    }
    
    /// Controller for present/push
    var presenter: UIViewController {
        if AppDirector.hasPresentedViewController {
            return AppDirector.topViewController!
        }
        
        // Controller from Side Menu
        let root = AppDirector.sharedInstance.rootController.rootViewController
        
        // Tabbar
        guard let tabController = root as? UITabBarController else {
            return root!
        }
        
        return tabController.selectedViewController!
    }
    
    /// Root (Side Menu)
    var rootController: RootAppController {
        get {
            return _rootController
        }
        set {
            _rootController = newValue
        }
    }
    
    // Navigate
    private func present(for view: UIViewController,_ transition: TransitionType) {
        let presenter = AppDirector.sharedInstance.presenter

        switch transition {
            case .Present(let animated):
                view.modalPresentationStyle = .fullScreen
                presenter.present(view, animated: animated, completion: nil)
            case .Push(let animated):
                guard let navigation: RootNavigationController = presenter as? RootNavigationController else {
                    view.navigationController?.pushViewController(view, animated: animated)
                    return
                }
                navigation.pushViewController(view, animated: animated)
            case .default: break
        }
    }
    
    /* Warning *** be able to use as long as has Controller class is in at least one storyboard. */
    static func instantiate<T: UIViewController>() -> T {
        var vc: T!
        for storyboard in UIStoryboard.Storyboard.list {
            let board: UIStoryboard = UIStoryboard(storyboard: storyboard)
            if let controller: T = board.instantiateVC(withIdentifier: T.reuseIdentifier) as? T {
                vc = controller
            }
        }
        return vc
    }
}


// MARK: - Route

extension AppDirector {
    
    enum Route {
        case Home(HomeViewModel.Sender)
    }
    
    /// For present controller without parameter.
    private func routing<T: UIViewController>(_ transition: TransitionType) -> T {
        let vc: T = AppDirector.instantiate()
        self.present(for: vc, transition)
        return vc
    }
    
    /// Route to ...
    func route(to route: Route) {
        switch route {
            case .Home(let sender):
                let vc: HomeViewController = AppDirector.instantiate()
                vc.viewModel.sender = sender
                present(for: vc, .Push(animated: true))
            /*
            case .Home:
                let _ : HomeViewController = self.routing(.Push(animated: true))
            */
        }
    }
    
    /// Logout and present login.
    func logout() {
        // Todo somthing.
    }
}


// MARK: - Alert

extension AppDirector {
    
    static func beef() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func alert(_ title: String,
               message: String,
               confirm: String = "OK",
               cancel: String? = nil,_ completion: ((_ isConfirm: Bool) -> ())? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: confirm, style: .default, handler: { action in
            completion?(true)
        }))
        if let cancelTitle = cancel, !cancelTitle.isEmpty {
            alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { action in
                completion?(false)
            }))
        }
        AppDirector.sharedInstance.presenter.present(alert, animated: true, completion: nil)
    }

}


// MARK: - Error

extension AppDirector {

    /// Alert for error reason.
    func error(_ error: DataError) {
        self.alert("Error \(error.status?.code ?? 0)", message: error.message ?? "")
    }
}
