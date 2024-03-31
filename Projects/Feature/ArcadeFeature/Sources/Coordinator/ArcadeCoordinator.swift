import UIKit

import FeatureDependency

public final class ArcadeCoordinator: Coordinator {
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
        let arcadeViewController = ArcadeViewController(
            viewModel: ArcadeViewModel()
        )
        navigationController.setViewControllers(
            [arcadeViewController],
            animated: false
        )
    }
}
