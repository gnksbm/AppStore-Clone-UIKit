import UIKit

import FeatureDependency

public final class ArcadeCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createArcadeViewController() -> UINavigationController {
        let arcadeViewController = ArcadeViewController(
            viewModel: ArcadeViewModel()
        )
        arcadeViewController.tabBarItem = .init(title: "Arcade", image: UIImage(systemName: "logo.playstation"), tag: 3)
        navigationController = UINavigationController(rootViewController: arcadeViewController)
        return navigationController
    }
}
