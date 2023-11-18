//
//  GameCoordinator.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class GameCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    func createGameViewController() -> UINavigationController {
        let gameViewController = GameViewController()
        gameViewController.tabBarItem = .init(title: "게임", image: UIImage(systemName: "gamecontroller"), tag: 1)
        navigationController = UINavigationController(rootViewController: gameViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
