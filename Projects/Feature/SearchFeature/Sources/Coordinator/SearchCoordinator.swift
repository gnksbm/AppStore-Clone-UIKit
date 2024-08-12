import UIKit

import Domain
import Core
import FeatureDependency

public final class SearchCoordinator: Coordinator {
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
        let searchViewController = SearchViewController(
            viewModel: SearchViewModel(coordinator: self)
        )
        navigationController.setViewControllers(
            [searchViewController],
            animated: false
        )
    }
}

extension SearchCoordinator {
    func startDetailFlow(id: Int) {
        let detailCoordinator = coordinatorProvider.makeDetailCoordinator(
            id: id,
            navigationController: navigationController
        )
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}
