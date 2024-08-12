//
//  CoordinatorProvider.swift
//  FeatureDependency
//
//  Created by gnksbm on 8/12/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

public protocol CoordinatorProvider {
    func makeDetailCoordinator(
        id: Int,
        navigationController: UINavigationController
    ) -> DetailCoordinator
}
