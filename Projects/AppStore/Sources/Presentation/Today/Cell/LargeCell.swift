//
//  LargeCell.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/23.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

class TodayLargeCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imgConfig = UIImage.SymbolConfiguration(font: .boldSystemFont(ofSize: <#T##CGFloat#>))
        let imageView = UIImageView()
        imageView.image = <#UIImage#>
        imageView.preferredSymbolConfiguration = imgConfig
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
//        [].forEach {
//            contentView.addSubview($0)
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//        
//        NSLayoutConstraint.activate([
//        ])
    }
}
