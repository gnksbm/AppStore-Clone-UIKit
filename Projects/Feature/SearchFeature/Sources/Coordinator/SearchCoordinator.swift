import UIKit
import FeatureDependency
import Domain
import Data

public final class SearchCoordinator: Coordinator {
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
    }
    
    public func createSearchViewController() -> UINavigationController {
        let searchViewController = SearchViewController(
            viewModel: SearchViewModel(
                useCase: DefaultSearchAppUseCase(
                    repository: DefaultApplicationRepository(
                        networkService: DefaultNetworkService()
                    )
                )
            )
        )
        searchViewController.tabBarItem = .init(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        navigationController = UINavigationController(rootViewController: searchViewController)
        return navigationController
    }
}

public class UseCaseProvider {
    public static func makeSearchAppUseCase() -> SearchAppUseCase {
        return DefaultSearchAppUseCase(
            repository: DefaultApplicationRepository(
                networkService: DefaultNetworkService()
            )
        )
    }
}
