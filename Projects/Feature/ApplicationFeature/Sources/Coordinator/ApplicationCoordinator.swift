import UIKit

import FeatureDependency

public final class ApplicationCoordinator: Coordinator {
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
    
    public func start() {
        let applicationViewController = ApplicationViewController(
            viewModel: ApplicationViewModel()
        )
        navigationController.setViewControllers(
            [applicationViewController],
            animated: false
        )
    }
}
