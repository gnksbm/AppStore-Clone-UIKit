import UIKit

import FeatureDependency

public final class GameCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createGameViewController() -> UINavigationController {
        let gameViewController = GameViewController(
            viewModel: GameViewModel()
        )
        gameViewController.tabBarItem = .init(title: "게임", image: UIImage(systemName: "gamecontroller"), tag: 1)
        navigationController = UINavigationController(rootViewController: gameViewController)
        return navigationController
    }
}
