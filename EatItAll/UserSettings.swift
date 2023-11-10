//
//  UserSettings.swift
//  EatItAll
//
//  Created by 王文杰 on 10/22/23.
//

import Foundation

class UserSettings: ObservableObject{
    @Published var isLoggedIn: Bool{
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "login")
        }
    }
    
    init() {
        self.isLoggedIn = false
    }
}
