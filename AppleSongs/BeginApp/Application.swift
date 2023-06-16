//
//  Application.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import UIKit

class Application {
    
    // MARK: - Properties
    
    var window: UIWindow
    
    // MARK: - Initializers
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Functions
    
    public func runTheApp() {
        let viewController = ViewController.Search()
        let nav = UINavigationController(rootViewController: viewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
