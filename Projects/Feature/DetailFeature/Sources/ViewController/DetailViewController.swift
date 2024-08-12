import UIKit

import Domain

import RxSwift

public final class DetailViewController: UIViewController {
    private let viewModel: DetailViewModel
    private let disposeBag = DisposeBag()
    
    private let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 10
        imgView.layer.borderWidth = 1
        imgView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: UIFont.labelFontSize)
        return label
    }()
    
    private let sellerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
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
    
    private let updateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .boldSystemFont(ofSize: UIFont.labelFontSize)
        return label
    }()
    
    private let updateVersionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let releaseNoteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let imageCollectionView = DetailImageCollectionView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
        bind()
    }
    
    private func bind() {
        let output = viewModel.transform(
            input: DetailViewModel.Input(
                viewWillAppearEvent: rx
                    .methodInvoked(#selector(Self.viewDidAppear))
                    .map { _ in }
            )
        )
        
        disposeBag.insert {
            output.detailItem
                .observe(on: MainScheduler.instance)
                .withUnretained(self)
                .bind { vc, item in
                    vc.iconImageView.loadImage(url: item.iconUrl)
                    vc.titleLabel.text = item.appName
                    vc.sellerNameLabel.text = item.appSellerName
                    vc.updateVersionLabel.text = "버전 \(item.latestVersion)"
                    vc.releaseNoteLabel.text = item.releaseNote
                    vc.imageCollectionView.update(items: item.screenshotUrls)
                    vc.descriptionLabel.text = item.appDescription
                }
        }
    }
    
    private func configureLayout() {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        [
            iconImageView,
            titleLabel,
            sellerNameLabel,
            downloadBtn,
            updateTitleLabel,
            updateVersionLabel,
            releaseNoteLabel,
            imageCollectionView,
            descriptionLabel
        ].forEach {
            scrollView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            iconImageView.topAnchor.constraint(
                equalTo: scrollView.topAnchor,
                constant: padding
            ),
            iconImageView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: padding
            ),
            iconImageView.widthAnchor.constraint(
                equalTo: scrollView.widthAnchor,
                multiplier: 1/4
            ),
            iconImageView.heightAnchor.constraint(
                equalTo: iconImageView.widthAnchor
            ),
            
            sellerNameLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: padding
            ),
            sellerNameLabel.centerYAnchor.constraint(
                equalTo: iconImageView.centerYAnchor
            ),
            
            titleLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: padding
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: sellerNameLabel.topAnchor,
                constant: -padding
            ),
            
            downloadBtn.topAnchor.constraint(
                equalTo: sellerNameLabel.topAnchor,
                constant: padding
            ),
            downloadBtn.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: padding
            ),
            downloadBtn.widthAnchor.constraint(
                equalToConstant: 80
            ),
            
            updateTitleLabel.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: padding
            ),
            updateTitleLabel.topAnchor.constraint(
                equalTo: iconImageView.bottomAnchor,
                constant: padding * 2
            ),
            
            updateVersionLabel.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: padding
            ),
            updateVersionLabel.topAnchor.constraint(
                equalTo: updateTitleLabel.bottomAnchor,
                constant: padding
            ),
            
            releaseNoteLabel.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: padding
            ),
            releaseNoteLabel.topAnchor.constraint(
                equalTo: updateVersionLabel.bottomAnchor,
                constant: padding
            ),
            releaseNoteLabel.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor,
                constant: -padding
            ),
            
            imageCollectionView.topAnchor.constraint(
                equalTo: releaseNoteLabel.bottomAnchor,
                constant: padding
            ),
            imageCollectionView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: padding
            ),
            imageCollectionView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor,
                constant: -padding
            ),
            imageCollectionView.heightAnchor.constraint(
                equalTo: imageCollectionView.widthAnchor,
                multiplier: 1.2
            ),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: imageCollectionView.bottomAnchor,
                constant: padding
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: imageCollectionView.leadingAnchor
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: imageCollectionView.trailingAnchor
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor,
                constant: -padding
            ),
        ])
    }
}

#if DEBUG
import SwiftUI
import FeatureDependency
struct DetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            DetailViewController(
                viewModel: DetailViewModel(
                    appID: 6479689895,
                    useCase: DefaultDetailUseCase()
                )
            )
        }
    }
}
#endif
