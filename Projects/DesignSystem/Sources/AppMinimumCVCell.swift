//
//  AppMinimumCVCell.swift
//  SearchFeature
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import Core
import Domain

import RxSwift

public final class AppMinimumCVCell: UICollectionViewCell {
    let disposeBag = DisposeBag()
    
    private let appImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel, descriptionLabel
            ]
        )
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.sizeToFit()
        label.font = .boldSystemFont(ofSize: UIFont.labelFontSize)
//        label.setContentHuggingPriority(
//            .defaultHigh,
//            for: .vertical
//        )
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
        label.textColor = .gray
        return label
    }()
    
    private let downloadBtn: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "받기"
        config.cornerStyle = .capsule
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
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        appImgView.image = nil
        [titleLabel, descriptionLabel]
            .forEach {
                $0.text = nil
            }
    }
    
    public func updateUI(response: SearchAppMinResponse) {
        appImgView.loadImage(url: response.iconUrl)
        titleLabel.text = response.appName
        descriptionLabel.text = response.appDescription
    }
    
    private func configureUI() {
        [appImgView, stackView, downloadBtn, dividerView]
            .forEach {
                contentView.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            appImgView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 5
            ),
            appImgView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            appImgView.widthAnchor.constraint(
                equalToConstant: 60
            ),
            appImgView.heightAnchor.constraint(
                equalToConstant: 60
            ),
            
            downloadBtn.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -5
            ),
            downloadBtn.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            downloadBtn.widthAnchor.constraint(
                equalToConstant: 70
            ),
            
            stackView.leadingAnchor.constraint(
                equalTo: appImgView.trailingAnchor,
                constant: 10
            ),
            stackView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            stackView.trailingAnchor.constraint(
                equalTo: downloadBtn.leadingAnchor,
                constant: -10
            ),
            
            dividerView.leadingAnchor.constraint(
                equalTo: stackView.leadingAnchor
            ),
            dividerView.trailingAnchor.constraint(
                equalTo: downloadBtn.trailingAnchor
            ),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
