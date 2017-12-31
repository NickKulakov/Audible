//
//  MainNavigationController.swift
//  Audible
//
//  Created by Peter on 12/29/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit
class MainNavigationController: UINavigationController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        if isLoggedIn() {
            // assume user is logged in
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
            
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    @objc func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            
        })
    }
}
