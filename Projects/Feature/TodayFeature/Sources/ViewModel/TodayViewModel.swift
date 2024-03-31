import Foundation

import Domain
import FeatureDependency
import Core

import RxSwift
import RxCocoa

public final class TodayViewModel: ViewModel {
    private var disposeBag = DisposeBag()
    private var useCase: TodayUseCase
    
    public struct Input {
        let viewDidLoad: Observable<Void>
    }
    public struct Output {
    }
    
    public init(useCase: TodayUseCase) {
        self.useCase = useCase
    }
    
    public func transform(input: Input) -> Output {
        return Output()
    }
}
