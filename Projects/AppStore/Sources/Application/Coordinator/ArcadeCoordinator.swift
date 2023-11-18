//
//  ArcadeCoordinator.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class ArcadeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    func createArcadeViewController() -> UINavigationController {
        let arcadeViewController = ArcadeViewController()
        arcadeViewController.tabBarItem = .init(title: "Arcade", image: UIImage(systemName: "logo.playstation"), tag: 3)
        navigationController = UINavigationController(rootViewController: arcadeViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
