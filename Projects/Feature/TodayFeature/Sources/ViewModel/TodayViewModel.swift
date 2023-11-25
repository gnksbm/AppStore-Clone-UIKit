import Foundation

import Domain
import FeatureDependency

import RxSwift
import RxCocoa

public final class TodayViewModel: ViewModel {
    private var disposeBag = DisposeBag()
    
    public struct Input {
    }
    public struct Output {
    }
    
    public init() {
    }
    
    public func transform(input: Input) -> Output {
        return Output()
    }
}
