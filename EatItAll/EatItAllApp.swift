//
//  EatItAllApp.swift
//  EatItAll
//
//  Created by 王文杰 on 4/16/23.
//

import SwiftUI

@main
struct EatItAllApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                MainView()
            } else {
                StartView()
            }
        }
    }
}
