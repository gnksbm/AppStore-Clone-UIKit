//
//  SearchCoordinator.swift
//  SearchFeature
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import FeatureDependency
import Domain
import Data

public final class SearchCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createSearchViewController() -> UINavigationController {
        let searchViewController = SearchViewController(
            viewModel: SearchViewModel(
                useCase: UseCaseProvider.makeSearchAppUseCase()
//                useCase: DefaultSearchAppUseCase(
//                    repository: DefaultApplicationRepository(
//                        networkService: DefaultNetworkService()
//                    )
//                )
            )
        )
        searchViewController.tabBarItem = .init(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        navigationController = UINavigationController(rootViewController: searchViewController)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}

class UseCaseProvider {
    static func makeSearchAppUseCase() -> SearchAppUseCase {
        return DefaultSearchAppUseCase(
            repository: DefaultApplicationRepository(
                networkService: DefaultNetworkService()
            )
        )
    }
}
