//
//  TodayViewController.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit
import RxSwift

final class TodayViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<TodaySection, String>!
    private var snapshot: NSDiffableDataSourceSnapshot<TodaySection, String>!
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}
// MARK: DataSource
extension TodayViewController {
    private func configureDataSource() {
        dataSource = .init(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: self.makeLargeRegistration(),
                for: indexPath,
                item: item
            )
        }
    }
    
    private func makeLargeRegistration() -> UICollectionView.CellRegistration<TodayLargeCell, String> {
        .init { _, _, _ in
            
        }
    }
}
// MARK: Layout
extension TodayViewController {
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        .init { index, _ in
            switch TodaySection.allCases[index] {
            case .today:
                return self.makeTodaySection()
            }
        }
    }
    
    private func makeTodaySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1))
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ), subitems: [item]
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        return section
    }
}
// MARK: Section
extension TodayViewController {
    enum TodaySection: CaseIterable {
        case today
    }
}

#if DEBUG
import FeatureDependency
import SwiftUI
struct TodayViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview(TodayViewController())
    }
}
#endif
