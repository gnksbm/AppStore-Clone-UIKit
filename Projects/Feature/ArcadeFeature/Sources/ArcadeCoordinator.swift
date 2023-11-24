//
//  ArcadeCoordinator.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import FeatureDependency

public final class ArcadeCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createArcadeViewController() -> UINavigationController {
        let arcadeViewController = ArcadeViewController()
        arcadeViewController.tabBarItem = .init(title: "Arcade", image: UIImage(systemName: "logo.playstation"), tag: 3)
        navigationController = UINavigationController(rootViewController: arcadeViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
