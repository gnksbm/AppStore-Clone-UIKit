import UIKit

import FeatureDependency

public final class ApplicationCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createApplicationViewController() -> UINavigationController {
        let applicationViewController = ApplicationViewController(
            viewModel: ApplicationViewModel()
        )
        applicationViewController.tabBarItem = .init(title: "앱", image: UIImage(systemName: "square.stack.3d.up.fill"), tag: 2)
        navigationController = UINavigationController(rootViewController: applicationViewController)
        return navigationController
    }
}
