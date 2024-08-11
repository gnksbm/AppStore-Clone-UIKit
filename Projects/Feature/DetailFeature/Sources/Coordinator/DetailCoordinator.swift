import UIKit

import FeatureDependency

public final class DetailCoordinator: Coordinator {
    public var parentCoordinator: Coordinator?
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let detailViewController = DetailViewController(
            viewModel: DetailViewModel()
        )
        navigationController.pushViewController(
            detailViewController,
            animated: true
        )
    }
    
    public func createDetailViewController() -> UINavigationController {
        let detailViewController = DetailViewController(
            viewModel: DetailViewModel()
        )
        navigationController = UINavigationController(rootViewController: detailViewController)
        return navigationController
    }
}
