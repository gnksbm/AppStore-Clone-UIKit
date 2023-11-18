//
//  SearchCoordinator.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    func createSearchViewController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = .init(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        navigationController = UINavigationController(rootViewController: searchViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
