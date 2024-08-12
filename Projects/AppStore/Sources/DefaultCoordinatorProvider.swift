//
//  DefaultCoordinatorProvider.swift
//  AppStore
//
//  Created by gnksbm on 8/12/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import FeatureDependency
import DetailFeature

final class DefaultCoordinatorProvider: CoordinatorProvider {
    func makeDetailCoordinator(
        id: Int,
        navigationController: UINavigationController
    ) -> DetailCoordinator {
        DefaultDetailCoordinator(
            appID: id,
            navigationController: navigationController
        )
    }
}
