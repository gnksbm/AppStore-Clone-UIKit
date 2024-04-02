//
//  StarRatingView.swift
//  DesignSystem
//
//  Created by gnksbm on 4/1/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import Core

public final class StarRatingView: UIView {
    private lazy var starStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: starImgViews + [countLabel]
        )
        stackView.spacing = 0
        stackView.alignment = .center
        return stackView
    }()
    
    private let starImgViews: [UIImageView] = {
        var imgViews: [UIImageView] = []
        for index in 0..<5 {
            let imgView = UIImageView()
            imgView.tintColor = .gray
            imgView.contentMode = .center
            imgView.image = UIImage(systemName: "star")
            imgView.tag = index
            imgView.preferredSymbolConfiguration = .init(
                font: .systemFont(ofSize: 12)
            )
            imgViews.append(imgView)
        }
        return imgViews
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func prepareForReuse() {
        starImgViews.forEach { imgView in
            imgView.image = nil
        }
        countLabel.text = nil
    }
    
    public func drawStar(
        rating: Double,
        ratingCount: Int
    ) {
        let fullStarsCount = Int(rating)
        let remainder = rating - Double(fullStarsCount)
        starImgViews
            .filter { imgView in
                imgView.tag < fullStarsCount
            }
            .forEach { imgView in
                imgView.image = UIImage(systemName: "star.fill")
            }
        
        if remainder > 0.5 {
            starImgViews
                .first { imgView in
                    imgView.image == nil
                }?
                .image = UIImage(systemName: "star.leadinghalf.filled")
        }
        
        let emptyStarsCount = 5 - fullStarsCount - Int(remainder)
        
        starImgViews
            .filter { imgView in
                imgView.image == nil
            }
            .forEach { imgView in
                imgView.image = UIImage(systemName: "star")
            }
        countLabel.text = " " + ratingCount.toKRStr
    }
    
    private func configureUI() {
        [starStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            starStackView.topAnchor.constraint(equalTo: topAnchor),
            starStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
