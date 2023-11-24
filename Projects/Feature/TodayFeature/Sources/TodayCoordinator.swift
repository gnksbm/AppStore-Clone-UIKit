//
//  TodayCoordinator.swift
//  TodayFeature
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import FeatureDependency

public final class TodayCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createTodayViewController() -> UINavigationController {
        let todayViewController = TodayViewController()
        todayViewController.tabBarItem = .init(title: "투데이", image: UIImage(systemName: "doc.text.image"), tag: 0)
        navigationController = UINavigationController(rootViewController: todayViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
