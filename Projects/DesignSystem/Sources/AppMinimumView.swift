//
//  AppMinimumView.swift
//  DesignSystem
//
//  Created by gnksbm on 4/2/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import UIKit

import Core
import Domain

import RxSwift

public final class AppMinimumView: UIView {
    private let appImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 10
        imgView.layer.borderWidth = 1
        imgView.layer.borderColor = UIColor.quaternaryLabel.cgColor
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
        label.font = .systemFont(
            ofSize: UIFont.labelFontSize,
            weight: .light
        )
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(
            ofSize: 14,
            weight: .light
        )
        label.textColor = .gray
        return label
    }()
    
    private let downloadBtn: UIButton = {
        var config = UIButton.Configuration.bordered()
        var attributeContainer = AttributeContainer()
        attributeContainer.font = UIFont.boldSystemFont(
            ofSize: UIFont.labelFontSize
        )
        config.attributedTitle = .init(
            "받기",
            attributes: attributeContainer
        )
        config.cornerStyle = .capsule
        let button = UIButton(configuration: config)
        return button
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .quaternaryLabel
        return view
    }()
    
    public convenience init(hasDivider: Bool) {
        self.init()
        dividerView.isHidden = !hasDivider
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func prepareForReuse() {
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
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            appImgView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            appImgView.centerYAnchor.constraint(
                equalTo: centerYAnchor
            ),
            appImgView.widthAnchor.constraint(
                equalToConstant: 60
            ),
            appImgView.heightAnchor.constraint(
                equalToConstant: 60
            ),
            
            downloadBtn.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            downloadBtn.centerYAnchor.constraint(
                equalTo: centerYAnchor
            ),
            downloadBtn.widthAnchor.constraint(
                equalToConstant: 80
            ),
            
            stackView.leadingAnchor.constraint(
                equalTo: appImgView.trailingAnchor,
                constant: 10
            ),
            stackView.centerYAnchor.constraint(
                equalTo: centerYAnchor
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
