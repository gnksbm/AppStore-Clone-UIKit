//
//  Preview.swift
//  FeatureDependency
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

#if DEBUG
import SwiftUI

import Core
import Domain

public struct UIKitPreview: UIViewControllerRepresentable {
    public let viewController: () -> UIViewController
    
    public init(viewController: @escaping () -> UIViewController) {
        self.viewController = viewController    }
    
    public func makeUIViewController(context: Context) -> some UINavigationController {
        registerDependencies()
        return .init(rootViewController: viewController())
    }
    
    public func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) { }
    
    private func registerDependencies() {
        let applicationRepository = MockApplicationRepository()
        let randomWordRepository = MockRandomWordRepository()
        DIContainer.register(
            type: SearchAppUseCase.self,
            DefaultSearchAppUseCase(
                applicationRepository: applicationRepository,
                randomWordRepository: randomWordRepository
            )
        )
    }
}
#endif
