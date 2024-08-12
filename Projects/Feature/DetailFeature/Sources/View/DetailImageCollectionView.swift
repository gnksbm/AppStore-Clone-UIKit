//
//  DetailImageCollectionView.swift
//  DetailFeature
//
//  Created by gnksbm on 8/12/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class DetailImageCollectionView: UICollectionView {
    static func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { _, _ in
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.8),
                    heightDimension: .fractionalWidth(1.2)
                ),
                subitems: [item]
            )
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.interGroupSpacing = 20
            return section
        }
    }
    
    var diffableDataSource: UICollectionViewDiffableDataSource<Section, URL>!
    
    init() {
        super.init(frame: .zero, collectionViewLayout: Self.createLayout())
        configureDataSource()
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(items: [URL]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, URL>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        diffableDataSource.apply(snapshot)
    }
    
    private func configureDataSource() {
        let cellRegistration = DetailImageCVCell.createRegistration()
        diffableDataSource = UICollectionViewDiffableDataSource<Section, URL>(
            collectionView: self
        ) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: item
            )
        }
    }
    
    enum Section {
        case main
    }
}
