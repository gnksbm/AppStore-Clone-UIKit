//
//  Preview.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import SwiftUI
#if DEBUG
struct UIKitPreview: UIViewControllerRepresentable {
    var selectedIndex: Int
    private let tc = UITabBarController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        tc.viewControllers = MainTab.makeViewControllers()
        tc.selectedIndex = selectedIndex
        return tc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
#endif
