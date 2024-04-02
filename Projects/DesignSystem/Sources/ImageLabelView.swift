//
//  ImageLabelView.swift
//  DesignSystem
//
//  Created by gnksbm on 4/1/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

public final class ImageLabelView: UIView {
    private let imgView: UIImageView = { 
        let imgView = UIImageView()
        imgView.tintColor = .gray
        imgView.contentMode = .center
        imgView.preferredSymbolConfiguration = .init(
            font: .systemFont(ofSize: 14)
        )
        return imgView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    public init(
        image: UIImage?,
        text: String,
        priority: UILayoutPriority = .defaultLow
    ) {
        super.init(frame: .zero)
        imgView.image = image
        label.text = text
        label.setContentCompressionResistancePriority(
            priority,
            for: .horizontal
        )
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateText(text: String?) {
        label.text = text
        layoutIfNeeded()
    }
    
    private func configureUI() {
        [imgView, label].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            imgView.centerYAnchor.constraint(
                equalTo: centerYAnchor
            ),
            imgView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            imgView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            
            label.centerYAnchor.constraint(
                equalTo: centerYAnchor
            ),
            label.leadingAnchor.constraint(
                equalTo: imgView.trailingAnchor,
                constant: 5
            ),
            label.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
        ])
    }
}
