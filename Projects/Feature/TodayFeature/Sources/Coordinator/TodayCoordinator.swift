import UIKit

import Domain
import Core
import FeatureDependency

public final class TodayCoordinator: Coordinator {
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
        let todayViewController = TodayViewController(
            viewModel: TodayViewModel()
        )
        navigationController.setViewControllers(
            [todayViewController],
            animated: false
        )
    }
}
