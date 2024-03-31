//
//  AppDelegate+Register.swift
//  SearchFeatureDemoApp
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Core
import Domain
import FeatureDependency

extension AppDelegate {
    func registerDependencies() {
        DIContainer.register(
            type: SearchAppUseCase.self,
            DefaultSearchAppUseCase(
                applicationRepository: MockApplicationRepository(),
                randomWordRepository: MockRandomWordRepository()
            )
        )
    }
}
