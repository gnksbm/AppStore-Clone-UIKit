//
//  SearchViewController.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/17.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import Domain
import Data
import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    private var snapshot: NSDiffableDataSourceSnapshot<Int, String>!
    private var viewModel: SearchViewModel!
    private var disposeBag = DisposeBag()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
//        searchController.searchResultsUpdater = self
        return searchController
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
        configureUI()
        bind()
    }
    
    private func bind() {
        let input = SearchViewModel.Input(
            searchTerm: searchController.searchBar.rx
                .text.orEmpty.asObservable()
        )
        
        let output = viewModel.transform(input: input)
    }
    
    private func configureUI() {
        title = "검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
//        [].forEach {
//            <#view#>.addSubview($0)
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//
//        let safeArea = <#view#>.safeAreaLayoutGuide
//
//        NSLayoutConstraint.activate([
//        ])
    }
}

#if DEBUG
import SwiftUI
struct SearchViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview(
            SearchViewController(
                viewModel: SearchViewModel(
                    useCase: DefaultSearchAppUseCase(
                        repository: DefaultApplicationRepository(
                            networkService: DefaultNetworkService()
                        )
                    )
                )
            )
        )
    }
}
#endif
