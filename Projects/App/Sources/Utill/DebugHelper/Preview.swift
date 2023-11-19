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
    func makeUIViewController(context: Context) -> some UINavigationController {
        let coordinator = AppCoordinator(navigationController: .init())
        coordinator.start()
        return coordinator.navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
#endif
