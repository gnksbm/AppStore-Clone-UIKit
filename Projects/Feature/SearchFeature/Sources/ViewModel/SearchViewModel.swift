import Foundation

import Core
import Domain
import FeatureDependency

import RxSwift
import RxCocoa

public final class SearchViewModel: ViewModel {
    @Injected(SearchAppUseCase.self)
    private var useCase: SearchAppUseCase
    private var disposeBag = DisposeBag()
    
    public init() {
    }
    
    public func transform(input: Input) -> Output {
        let output = Output(
            appList: .just([]),
            recommend: useCase.getRandomWords(query: .init())
        )
        
        input.searchBarText
            .debounce(.microseconds(2), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, text in
                    viewModel.useCase.searchApp(
                        query: .init(term: text)
                    )
                }
            )
            .disposed(by: disposeBag)
        return output
    }
}

extension SearchViewModel {
    public struct Input {
        let viewWillAppear: Observable<Void>
        let searchBarText: Observable<String>
    }
    public struct Output {
        let appList: Observable<[ApplicationData]>
        let recommend: Observable<[String]>
    }
}

#if DEBUG
import SwiftUI
import FeatureDependency
import Domain

struct SearchViewModel_Preview: PreviewProvider {
    static var previews: some View {
        UIKitPreview {
            SearchViewController(
                viewModel: SearchViewModel()
            )
        }
    }
}
#endif
