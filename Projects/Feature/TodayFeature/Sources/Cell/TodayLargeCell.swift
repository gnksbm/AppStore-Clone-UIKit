//
//  TodayLargeCell.swift
//  TodayFeatureDemoApp
//
//  Created by gnksbm on 2023/11/25.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

public final class TodayLargeCell: UICollectionViewCell {
    let imageView: UIImageView = {
//        let imgConfig = UIImage.SymbolConfiguration(font: .boldSystemFont(ofSize: <#T##CGFloat#>))
        let imageView = UIImageView()
//        imageView.image = <#UIImage#>
//        imageView.preferredSymbolConfiguration = imgConfig
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [imageView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
