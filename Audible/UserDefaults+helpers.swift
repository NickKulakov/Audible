//
//  UserDefaults+helpers.swift
//  Audible
//
//  Created by Peter on 12/31/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    func setIsLoggedIn(value: Bool) {
        set(false, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func isLoggedIn()->Bool{
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
