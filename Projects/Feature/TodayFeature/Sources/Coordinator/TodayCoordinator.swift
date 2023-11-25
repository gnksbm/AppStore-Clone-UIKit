import UIKit
import FeatureDependency

public final class TodayCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createTodayViewController() -> UINavigationController {
        let todayViewController = TodayViewController(
            viewModel: TodayViewModel()
        )
        todayViewController.tabBarItem = .init(title: "투데이", image: UIImage(systemName: "doc.text.image"), tag: 0)
        navigationController = UINavigationController(rootViewController: todayViewController)
        return navigationController
    }
}
