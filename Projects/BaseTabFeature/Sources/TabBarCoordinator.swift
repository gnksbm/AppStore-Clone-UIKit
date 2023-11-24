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
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    private var tabBarController: UITabBarController!
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        tabBarController = TabBarViewController()
        
        let todayCoordinator = TodayCoordinator(navigationController: navigationController)
        let gameCoordinator = GameCoordinator(navigationController: navigationController)
        let applicationCoordinator = ApplicationCoordinator(navigationController: navigationController)
        let arcadeCoordinator = ArcadeCoordinator(navigationController: navigationController)
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        
        childCoordinators = [todayCoordinator, gameCoordinator, applicationCoordinator, arcadeCoordinator, searchCoordinator]
        
        let todayViewController = todayCoordinator.createTodayViewController()
        let gameViewController = gameCoordinator.createGameViewController()
        let applicationViewController = applicationCoordinator.createApplicationViewController()
        let arcadeViewController = arcadeCoordinator.createArcadeViewController()
        let searchViewController = searchCoordinator.createSearchViewController()
        
        tabBarController.viewControllers = [todayViewController, gameViewController, applicationViewController, arcadeViewController, searchViewController]
        
        navigationController.pushViewController(tabBarController, animated: false)
    }
}
