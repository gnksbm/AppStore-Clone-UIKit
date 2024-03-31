import UIKit

import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {
    private var dataSource
    : UICollectionViewDiffableDataSource<SearchSection, String>!
    private var snapshot
    : NSDiffableDataSourceSnapshot<SearchSection, String>!
    private var viewModel: SearchViewModel!
    private var disposeBag = DisposeBag()
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        return searchController
    }()
    
    let profileBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        let image = UIImage(systemName: "person.crop.circle")
        let imgConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25)
        )
        config.image = image
        config.preferredSymbolConfigurationForImage = imgConfig
        let button = UIButton(configuration: config)
        return button
    }()
    
    init(viewModel: SearchViewModel!) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureUI()
        bind()
    }
    
    private func bind() {
        let output = viewModel.transform(
            input: SearchViewModel.Input(
                viewWillAppear: rx
                    .methodInvoked(#selector(UIViewController.viewWillAppear))
                    .map { _ in },
                searchBarText: searchController.searchBar.rx
                    .text.orEmpty.asObservable()
            )
        )
    }
    
    private func configureUI() {
        [collectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    private func configureNavigationBar() {
        title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        configureCustomNavigationBtn()
    }
    
    private func configureCustomNavigationBtn() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        [profileBtn].forEach {
            navigationBar.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            profileBtn.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            profileBtn.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -searchController.searchBar.bounds.height),
        ])
    }
}

extension SearchViewController {
    private func configureDataSource() {
        let discoveryRegistration = makeDiscoveryRegistration()
        dataSource = .init(collectionView: collectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: discoveryRegistration,
                for: indexPath,
                item: item
            )
        }
    }
    
    private func makeDiscoveryRegistration() -> UICollectionView.CellRegistration<DiscoveryCell, String> {
        .init { cell, _, item in
            cell.searchBtn.configuration?.title = item
        }
    }
    
    private func updateSnapshot() {
        snapshot = .init()
        snapshot.appendSections(SearchSection.allCases)
    }
}
// MARK: Section
extension SearchViewController {
    private enum SearchSection: CaseIterable {
        case discovery, recommended
    }
}

#if DEBUG
import SwiftUI
import FeatureDependency
import Domain

struct SearchViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            SearchViewController(
                viewModel: SearchViewModel()
            )
        }
    }
}
#endif
