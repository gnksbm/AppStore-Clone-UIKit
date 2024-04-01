//
//  DiscoveryCell.swift
//  SearchFeature
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class DiscoveryCell: UICollectionViewCell {
    let btnTapEvent = PublishSubject<String>()
    var disposeBag = DisposeBag()
    
    private let searchBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        let image = UIImage(systemName: "magnifyingglass")
        let imgConfig = UIImage.SymbolConfiguration(
            font: .systemFont(ofSize: 10)
        )
        config.image = image
        config.preferredSymbolConfigurationForImage = imgConfig
        config.imagePadding = 10
        var titleContainer = AttributeContainer()
        titleContainer.font = .systemFont(
            ofSize: 10,
            weight: .regular
        )
        config.attributedTitle = AttributedString(
            "",
            attributes: titleContainer
        )
        let button = UIButton(configuration: config)
        return button
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .quaternaryLabel
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = .init()
    }
    
    func updateUI(btnTitle: String) {
        searchBtn.configuration?.title = btnTitle
        
        searchBtn.rx.tap
            .withUnretained(self)
            .map { cell, _ in
                cell.searchBtn.titleLabel?.text ?? ""
            }
            .bind(to: btnTapEvent)
            .disposed(by: disposeBag)
    }
    
    private func configureUI() {
        [searchBtn, dividerView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            searchBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dividerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dividerView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.89
            ),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}

#if DEBUG
import SwiftUI
import FeatureDependency

struct DiscoveryCell_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            SearchViewController(
                viewModel: SearchViewModel()
            )
        }
    }
}
#endif
