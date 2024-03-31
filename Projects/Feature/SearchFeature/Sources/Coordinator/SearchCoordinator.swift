import UIKit

import Domain
import Core
import FeatureDependency

public final class SearchCoordinator: Coordinator {
    public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = []
    public let navigationController: UINavigationController
    
    public init(
        parentCoordinator: Coordinator? = nil,
        navigationController: UINavigationController
    ) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    @Injected(ApplicationRepository.self) var applicationRepository: ApplicationRepository
    @Injected(RandomWordRepository.self) var randomWordRepository: RandomWordRepository
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let searchViewController = SearchViewController(
            viewModel: SearchViewModel()
        )
        navigationController.setViewControllers(
            [searchViewController],
            animated: false
        )
    }
}
