import UIKit

import Domain
import FeatureDependency

public final class DefaultDetailCoordinator: DetailCoordinator {
    private let appID: Int
    public var navigationController: UINavigationController
    
    public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = []
    
    public init(
        appID: Int,
        navigationController: UINavigationController
    ) {
        self.appID = appID
        self.navigationController = navigationController
    }
    
    public func start() {
        let detailViewController = DetailViewController(
            viewModel: DetailViewModel(
                appID: appID,
                useCase: DefaultDetailUseCase()
            )
        )
        navigationController.pushViewController(
            detailViewController,
            animated: true
        )
    }
    
    public func createDetailViewController() -> UINavigationController {
        let detailViewController = DetailViewController(
            viewModel: DetailViewModel(
                appID: appID,
                useCase: DefaultDetailUseCase()
            )
        )
        navigationController = 
        UINavigationController(rootViewController: detailViewController)
        return navigationController
    }
}
