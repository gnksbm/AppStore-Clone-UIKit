//
//  TodayViewController.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class TodayViewController: UIViewController {
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    private var snapshot: NSDiffableDataSourceSnapshot<Int, String>!

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    private func configureUI() {
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
struct TodayViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview()
    }
}
#endif
