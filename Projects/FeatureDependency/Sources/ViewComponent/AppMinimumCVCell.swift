//
//  AppMinimumCVCell.swift
//  FeatureDependency
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import Core
import DesignSystem
import Domain

import RxSwift

public final class AppMinimumCVCell: UICollectionViewCell {
    public let disposeBag = DisposeBag()
    
    private let appMinimumView = AppMinimumView(hasDivider: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        appMinimumView.prepareForReuse()
    }
    
    public func updateUI(response: SearchAppMinResponse) {
        appMinimumView.updateUI(response: response)
    }
    
    private func configureUI() {
        [appMinimumView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            appMinimumView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            appMinimumView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            appMinimumView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            appMinimumView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
        ])
    }
}
