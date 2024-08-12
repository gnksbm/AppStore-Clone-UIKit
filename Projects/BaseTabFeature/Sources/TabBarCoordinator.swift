//
//  TabBarCoordinator.swift
//  BaseTabFeature
//
//  Created by gnksbm on 2023/11/16.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import FeatureDependency
import TodayFeature
import GameFeature
import ApplicationFeature
import ArcadeFeature
import SearchFeature

public final class TabBarCoordinator: Coordinator {
    public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = []
    public let navigationController: UINavigationController
    public let coordinatorProvider: CoordinatorProvider
    
    public init(
        parentCoordinator: Coordinator? = nil,
        navigationController: UINavigationController,
        coordinatorProvider: CoordinatorProvider
    ) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
        self.coordinatorProvider = coordinatorProvider
    }
    
    public func start() {
        let tabBarViewController = TabBarViewController()
        tabBarViewController.viewControllers = TabKind.allCases
            .map { tabKind in
                makeNavigationController(tabKind: tabKind)
            }
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(
            tabBarViewController,
            animated: false
        )
    }
    
    private func makeNavigationController(tabKind: TabKind) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = tabKind.tabBarItem
        setupChildCoordinator(
            tabKind: tabKind,
            navigationController: navigationController
        )
        return navigationController
    }
    
    private func setupChildCoordinator(
        tabKind: TabKind,
        navigationController: UINavigationController
    ) {
        var childCoordinator: Coordinator
        switch tabKind {
        case .today:
            childCoordinator = TodayCoordinator(
                navigationController: navigationController
            )
        case .game:
            childCoordinator = GameCoordinator(
                navigationController: navigationController
            )
        case .app:
            childCoordinator = ApplicationCoordinator(
                navigationController: navigationController
            )
        case .arcade:
            childCoordinator = ArcadeCoordinator(
                navigationController: navigationController
            )
        case .search:
            childCoordinator = SearchCoordinator(
                navigationController: navigationController,
                coordinatorProvider: coordinatorProvider
            )
        }
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
}

enum TabKind: CaseIterable {
    case today, game, app, arcade, search
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .today:
            return .init(
                title: "투데이",
                image: UIImage(systemName: "doc.text.image"),
                tag: 0
            )
        case .game:
            return .init(
                title: "게임",
                image: UIImage(systemName: "gamecontroller"),
                tag: 1
            )
        case .app:
            return .init(
                title: "앱",
                image: UIImage(systemName: "square.stack.3d.up.fill"),
                tag: 2
            )
        case .arcade:
            return .init(
                title: "Arcade",
                image: UIImage(systemName: "logo.playstation"),
                tag: 3
            )
        case .search:
            return .init(
                title: "검색", 
                image: UIImage(systemName: "magnifyingglass"),
                tag: 4
            )
        }
    }
}
