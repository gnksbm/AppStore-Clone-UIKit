import Foundation

import Domain
import FeatureDependency
import Core

import RxSwift
import RxCocoa

public final class TodayViewModel: ViewModel {
    @Injected(TodayUseCase.self)
    private var useCase: TodayUseCase
    
    private var disposeBag = DisposeBag()
    
    public struct Input {
        let viewDidLoad: Observable<Void>
    }
    public struct Output {
    }
    
    public init() {
    }
    
    public func transform(input: Input) -> Output {
        return Output()
    }
}
