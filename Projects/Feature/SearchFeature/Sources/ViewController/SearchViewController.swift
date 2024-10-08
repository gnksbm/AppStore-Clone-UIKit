import UIKit
import FeatureDependency

import DesignSystem
import Domain

import RxSwift
import RxCocoa

final class SearchViewController: BaseViewController {
    private var dataSource
    : UICollectionViewDiffableDataSource<SearchSection, SearchItem>!
    private var snapshot
    : NSDiffableDataSourceSnapshot<SearchSection, SearchItem>!
    private var viewModel: SearchViewModel
    
    private var suggestionTapEvent = PublishSubject<String>()
    private var appItemTapEvent = PublishSubject<Int>()
    private var disposeBag = DisposeBag()
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeCVLayout()
    )
    
    private let searchedVC = SearchedAppViewController()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(
            searchResultsController: searchedVC
        )
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        return searchController
    }()
    
    let profileBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        let image = UIImage(systemName: "person.crop.circle")
        let imgConfig = UIImage.SymbolConfiguration(
            font: .systemFont(ofSize: 25)
        )
        config.image = image
        config.preferredSymbolConfigurationForImage = imgConfig
        let button = UIButton(configuration: config)
        return button
    }()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        configureNavigationBar()
        configureUI()       
        bind()
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
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.preferredSearchBarPlacement = .stacked
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
            profileBtn.bottomAnchor.constraint(
                equalTo: navigationBar.bottomAnchor, 
                constant: -searchController.searchBar.bounds.height
            ),
        ])
    }
    
    private func bind() {
        let output = viewModel.transform(
            input: SearchViewModel.Input(
                viewWillAppear: rx
                    .methodInvoked(
                        #selector(UIViewController.viewWillAppear)
                    )
                    .map { _ in },
                searchBarText: Observable.merge(
                    searchController.searchBar.rx
                        .text
                        .orEmpty
                        .skip(1)
                        .asObservable(),
                    suggestionTapEvent
                ),
                itemTapEvent: Observable.merge(
                    appItemTapEvent,
                    searchedVC.itemTapEvent
                )
            )
        )
        
        output.searchTermSuggestion
            .withUnretained(self)
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(
                onNext: { viewController, suggestions in
                    viewController.updateSnapshot(
                        searchTermSuggestion: suggestions
                    )
                }
            )
            .disposed(by: disposeBag)
        
        output.recommendedApp
            .withUnretained(self)
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(
                onNext: { viewController, responses in
                    viewController.updateSnapshot(
                        responses: responses
                    )
                }
            )
            .disposed(by: disposeBag)
        
        output.searchedApp
            .withUnretained(self)
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(
                onNext: { vc, responses in
                    vc.searchedVC.updateSnapshot(responses: responses)
                }
            )
            .disposed(by: disposeBag)
    }
}
// MARK: CollectionView
extension SearchViewController {
    private func configureDataSource() {
        let discoveryRegistration = makeDiscoveryRegistration()
        let recommendRegistration = makeRecommendRegistration()
        let headerRegistration = makeHeaderRegistration()
        dataSource = .init(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            switch SearchSection.allCases[indexPath.section] {
            case .discovery:
                collectionView.dequeueConfiguredReusableCell(
                    using: discoveryRegistration,
                    for: indexPath,
                    item: item
                )
            case .recommended:
                collectionView.dequeueConfiguredReusableCell(
                    using: recommendRegistration,
                    for: indexPath,
                    item: item
                )
            }
        }
        dataSource.supplementaryViewProvider = { collectionView, _, indexPath in
            collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration,
                for: indexPath
            )
        }
        configureSnapshot()
    }
    
    private func configureSnapshot() {
        snapshot = .init()
        snapshot.appendSections(SearchSection.allCases)
        dataSource.apply(snapshot)
    }
    
    private func makeDiscoveryRegistration(
    ) -> UICollectionView.CellRegistration<DiscoveryCell, SearchItem> {
        .init { [weak self] cell, _, item in
            guard let self else { return }
            switch item {
            case .discovery(let suggestion):
                cell.updateUI(btnTitle: suggestion)
                cell.btnTapEvent
                    .subscribe(
                        onNext: { text in
                            self.suggestionTapEvent.onNext(text)
                            self.searchController.searchBar.text = text
                            self.searchController.searchBar.becomeFirstResponder()
                        }
                    )
                    .disposed(by: cell.disposeBag)
            case .recommended(let response):
                break
            }
        }
    }
    
    private func makeRecommendRegistration(
    ) -> UICollectionView.CellRegistration<AppMinimumCVCell, SearchItem> {
        .init { [weak self] cell, _, item in
            guard let self else { return }
            switch item {
            case .discovery:
                break
            case .recommended(let response):
                cell.updateUI(response: response)
                let tapGesture = UITapGestureRecognizer()
                cell.addGestureRecognizer(tapGesture)
                tapGesture.rx.event
                    .map { _ in response.appID }
                    .bind(to: appItemTapEvent)
                    .disposed(by: cell.disposeBag)
            }
        }
    }
    
    private func makeHeaderRegistration(
    ) -> UICollectionView.SupplementaryRegistration<SearchCVHeader> {
        .init(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { header, _, indexPath in
            let title = SearchSection.allCases[indexPath.section].title
            header.updateUI(title: title)
        }
    }
    
    private func updateSnapshot(searchTermSuggestion: [String]) {
        snapshot.deleteItems(
            snapshot.itemIdentifiers(inSection: .discovery)
        )
        snapshot.appendItems(
            searchTermSuggestion
                .map { .discovery(searchTermSuggestion: $0) },
            toSection: .discovery
        )
        dataSource.apply(
            snapshot,
            animatingDifferences: false
        )
    }
    
    private func updateSnapshot(responses: [SearchAppMinResponse]) {
        snapshot.deleteItems(
            snapshot.itemIdentifiers(inSection: .recommended)
        )
        snapshot.appendItems(
            responses
                .map { .recommended(recommendedApp: $0) },
            toSection: .recommended
        )
        dataSource.apply(
            snapshot,
            animatingDifferences: false
        )
    }
    
    private func makeCVLayout() -> UICollectionViewCompositionalLayout {
        .init { index, _ in
            let section: NSCollectionLayoutSection
            switch SearchSection.allCases[index] {
            case .discovery:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1/2),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                let hGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1/3)
                    ),
                    subitems: [item]
                )
                let vGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(120)
                    ),
                    subitems: [hGroup]
                )
                section = NSCollectionLayoutSection(group: vGroup)
            case .recommended:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .estimated(80)
                    ),
                    subitems: [item]
                )
                group.contentInsets = .init(
                    top: 0,
                    leading: 10,
                    bottom: 0,
                    trailing: 10
                )
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 0
            }
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(30)
                ),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            header.contentInsets = .init(
                top: 20,
                leading: 10,
                bottom: 0,
                trailing: 10
            )
            section.boundarySupplementaryItems = [
                header
            ]
            section.contentInsets = .init(
                top: 10,
                leading: 10,
                bottom: 30,
                trailing: 10
            )
            return section
        }
    }
    
    private enum SearchSection: CaseIterable {
        case discovery, recommended
        
        var title: String {
            switch self {
            case .discovery:
                return "새로운 발견"
            case .recommended:
                return "추천 앱과 게임"
            }
        }
    }
    
    enum SearchItem: Hashable {
        case discovery(searchTermSuggestion: String)
        case recommended(recommendedApp: SearchAppMinResponse)
    }
}
