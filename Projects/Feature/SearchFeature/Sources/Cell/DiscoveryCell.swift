//
//  DiscoveryCell.swift
//  SearchFeature
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

class DiscoveryCell: UICollectionViewCell {
    let searchBtn: UIButton = {
        var config = UIButton.Configuration.plain()
        let image = UIImage(systemName: "magnifyingglass")
        let imgConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 10))
        var titleContainer = AttributeContainer()
        titleContainer.font = .systemFont(ofSize: 10, weight: .regular)
//        titleContainer.foregroundColor = <#UIColor#>
        config.image = image
        config.preferredSymbolConfigurationForImage = imgConfig
        config.attributedTitle = AttributedString("", attributes: titleContainer)
        let button = UIButton(configuration: config)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [searchBtn].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            searchBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            searchBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
