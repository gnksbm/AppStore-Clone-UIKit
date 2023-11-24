//
//  GameCoordinator.swift
//  GameFeature
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import FeatureDependency

public final class GameCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createGameViewController() -> UINavigationController {
        let gameViewController = GameViewController()
        gameViewController.tabBarItem = .init(title: "게임", image: UIImage(systemName: "gamecontroller"), tag: 1)
        navigationController = UINavigationController(rootViewController: gameViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
