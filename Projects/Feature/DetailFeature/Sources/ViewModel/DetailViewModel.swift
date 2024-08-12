import Foundation

import Core
import Domain
import FeatureDependency

import RxSwift
import RxCocoa

public final class DetailViewModel: ViewModel {
    private let appID: Int
    private var useCase: DetailUseCase
    
    private let disposeBag = DisposeBag()
    
    public init(
        appID: Int,
        useCase: DetailUseCase
    ) {
        self.appID = appID
        self.useCase = useCase
    }
    
    public func transform(input: Input) -> Output {
        let output = Output(
            detailItem: PublishSubject<AppDetailResponse>()
        )
        
        disposeBag.insert {
            input.viewWillAppearEvent
                .withUnretained(self)
                .flatMap { vm, _ in
                    vm.useCase.fetchDetailItem(id: "\(vm.appID)")
                }
                .bind(to: output.detailItem)
        }
        
        return output
    }
}

extension DetailViewModel {
    public struct Input {
        let viewWillAppearEvent: Observable<Void>
    }
    
    public struct Output {
        let detailItem: PublishSubject<AppDetailResponse>
    }
}
