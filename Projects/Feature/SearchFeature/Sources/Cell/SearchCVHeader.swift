//
//  SearchCVHeader.swift
//  SearchFeature
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

final class SearchCVHeader: UICollectionReusableView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        return label
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
        titleLabel.text = nil
    }
    
    func updateUI(title: String) {
        titleLabel.text = title
    }
    
    private func configureUI() {
        [titleLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
        ])
    }
}
