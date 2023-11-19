//
//  TodayCoordinator.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class TodayCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    func createTodayViewController() -> UINavigationController {
        let todayViewController = TodayViewController()
        todayViewController.tabBarItem = .init(title: "투데이", image: UIImage(systemName: "doc.text.image"), tag: 0)
        navigationController = UINavigationController(rootViewController: todayViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
