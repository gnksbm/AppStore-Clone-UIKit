//
//  AppDelegate+Appearance.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

extension AppDelegate {
    func setupAppearance() {
        setupTabbarAppearance()
        setupNavigationBarAppearance()   
    }
    
    private func setupTabbarAppearance() {
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().isTranslucent = false
    }
    
    private func setupNavigationBarAppearance() {
        UINavigationBar.appearance().backgroundColor = .systemBackground
        UINavigationBar.appearance().isTranslucent = true
    }
}
