//
//  Preview.swift
//  FeatureDependency
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import SwiftUI
#if DEBUG
public struct UIKitPreview: UIViewControllerRepresentable {
    public let viewController: UIViewController
    
    public init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    public func makeUIViewController(context: Context) -> some UINavigationController {
//        let coordinator = AppCoordinator(navigationController: .init())
//        coordinator.start()
//        return coordinator.navigationController
        return UINavigationController(rootViewController: viewController)
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
#endif
