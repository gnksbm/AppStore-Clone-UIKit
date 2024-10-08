//
//  AppCoordinator.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/16.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import FeatureDependency
import BaseTabFeature

final class AppCoordinator: Coordinator {
    public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = []
    public let navigationController: UINavigationController
    
    public init(
        parentCoordinator: Coordinator? = nil,
        navigationController: UINavigationController
    ) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarCoordinator = TabBarCoordinator(
            navigationController: navigationController,
            coordinatorProvider: DefaultCoordinatorProvider()
        )
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
    }
}
