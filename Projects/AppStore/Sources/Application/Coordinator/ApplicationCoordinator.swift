//
//  ApplicationCoordinator.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    func createApplicationViewController() -> UINavigationController {
        let applicationViewController = ApplicationViewController()
        applicationViewController.tabBarItem = .init(title: "앱", image: UIImage(systemName: "square.stack.3d.up.fill"), tag: 2)
        navigationController = UINavigationController(rootViewController: applicationViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
