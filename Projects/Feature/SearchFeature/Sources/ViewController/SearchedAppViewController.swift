//
//  SearchedAppViewController.swift
//  SearchFeature
//
//  Created by gnksbm on 4/1/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import DesignSystem
import Domain
import FeatureDependency

import RxSwift

final class SearchedAppViewController: BaseViewController {
    private var dataSource: DataSource!
    
    let itemTapEvent = PublishSubject<Int>()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView =  UICollectionView(
            frame: .zero,
            collectionViewLayout: makeLayout()
        )
        collectionView.dataSource = dataSource
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatasource()
        configureUI()
    }
    
    private func configureUI() {
        [collectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
        ])
    }
    
    private func configureDatasource() {
        let cellRegistration = makeCellRegistration()
        dataSource = DataSource(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: item
            )        }
    }
    
    private func makeCellRegistration(
    ) -> UICollectionView.CellRegistration
    <AppMidianCVCell, SearchAppMidResponse> {
        .init { [weak self] cell, _, response in
            guard let self else { return }
            cell.updateUI(response: response)
            let tapGesture = UITapGestureRecognizer()
            cell.addGestureRecognizer(tapGesture)
            tapGesture.rx.event
                .map { _ in response.minResponse.appID }
                .bind(to: itemTapEvent)
                .disposed(by: cell.disposeBag)
        }
    }
    
    func updateSnapshot(responses: [SearchAppMidResponse]) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(responses)
        dataSource.apply(snapshot)
    }
    
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { _, _ in
            let item = NSCollectionLayoutItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                ),
                subitems: [item]
            )
            group.contentInsets = .init(
                top: 20,
                leading: 20,
                bottom: 20,
                trailing: 20
            )
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
}

extension SearchedAppViewController {
    typealias DataSource
    = UICollectionViewDiffableDataSource<Int, SearchAppMidResponse>
    typealias Snapshot
    = NSDiffableDataSourceSnapshot<Int, SearchAppMidResponse>
}
