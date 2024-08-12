//
//  AppMidianCVCell.swift
//  FeatureDependency
//
//  Created by gnksbm on 4/1/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import DesignSystem
import Domain

import RxSwift

public final class AppMidianCVCell: UICollectionViewCell {
    public var disposeBag = DisposeBag()
    
    private let appMinimumView = AppMinimumView(hasDivider: false)
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                starRatingView, devInfoView, categoryInfoView
            ]
        )
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let starRatingView = StarRatingView()
    
    private let devInfoView = ImageLabelView(
        image: .init(systemName: "person.crop.square"),
        text: ""
    )
    
    private let categoryInfoView = ImageLabelView(
        image: .init(systemName: "apple.terminal"),
        text: "",
        priority: .defaultHigh
    )
    
    private lazy var screenshotStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: screenshotImgViews
        )
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let screenshotImgViews: [UIImageView] = {
        var screenshotImgViews = [UIImageView]()
        for index in 0..<3 {
            let imgView = UIImageView()
            imgView.tag = index
            imgView.clipsToBounds = true
            imgView.contentMode = .scaleAspectFill
            imgView.layer.cornerRadius = 10
            imgView.layer.borderWidth = 1
            imgView.layer.borderColor = UIColor.quaternaryLabel.cgColor
            screenshotImgViews.append(imgView)
        }
        return screenshotImgViews
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
        appMinimumView.prepareForReuse()
        starRatingView.prepareForReuse()
        devInfoView.updateText(text: nil)
        categoryInfoView.updateText(text: nil)
        screenshotImgViews.forEach {
            $0.image = nil
        }
    }
    
    public func updateUI(response: SearchAppMidResponse) {
        appMinimumView.updateUI(
            iconUrl: response.minResponse.iconUrl,
            appName: response.minResponse.appName,
            appDescription: response.minResponse.appDescription
        )
        starRatingView.drawStar(
            rating: response.averageRating,
            ratingCount: response.ratingCount
        )
        devInfoView.updateText(text: response.developerName)
        categoryInfoView.updateText(text: response.genre)
        screenshotImgViews.forEach { imgView in
            guard imgView.tag < response.screenshotUrls.count
            else { return }
            imgView.loadImage(url: response.screenshotUrls[imgView.tag])
        }
    }
    
    private func configureUI() {
        [
            appMinimumView,
            infoStackView,
            screenshotStackView
        ].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            appMinimumView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            appMinimumView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 5
            ),
            appMinimumView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -5
            ),
            appMinimumView.heightAnchor.constraint(
                equalToConstant: 70
            ),
            
            infoStackView.topAnchor.constraint(
                equalTo: appMinimumView.bottomAnchor,
                constant: 20
            ),
            infoStackView.leadingAnchor.constraint(
                equalTo: appMinimumView.leadingAnchor
            ),
            infoStackView.trailingAnchor.constraint(
                equalTo: appMinimumView.trailingAnchor
            ),
            
            screenshotStackView.topAnchor.constraint(
                equalTo: infoStackView.bottomAnchor,
                constant: 20
            ),
            screenshotStackView.leadingAnchor.constraint(
                equalTo: appMinimumView.leadingAnchor
            ),
            screenshotStackView.trailingAnchor.constraint(
                equalTo: appMinimumView.trailingAnchor
            ),
            screenshotStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
        ])
    }
}
