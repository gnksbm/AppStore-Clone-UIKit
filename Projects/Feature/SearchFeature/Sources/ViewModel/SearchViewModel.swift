import Foundation

import Domain
import FeatureDependency

import RxSwift
import RxCocoa

public final class SearchViewModel: ViewModel {
    public var useCase: SearchAppUseCase
    private var disposeBag = DisposeBag()
    
    public struct Input {
        let searchTerm: Observable<String>
    }
    public struct Output {
        let str: Observable<String>
    }
    
    public init(useCase: SearchAppUseCase) {
        self.useCase = useCase
    }
    
    public func transform(input: Input) -> Output {
        let strOb = input.searchTerm.asObservable()
        return Output(str: strOb)
    }
}
