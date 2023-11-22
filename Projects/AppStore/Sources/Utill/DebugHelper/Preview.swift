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
    let viewController: UIViewController
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    func makeUIViewController(context: Context) -> some UINavigationController {
//        let coordinator = AppCoordinator(navigationController: .init())
//        coordinator.start()
//        return coordinator.navigationController
        return UINavigationController(rootViewController: viewController)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
#endif
