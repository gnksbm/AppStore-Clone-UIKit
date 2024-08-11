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
            searchTermSuggestion: useCase.fetchRandomWords(query: .init()),
            recommendedApp: useCase.recommendedApp,
            searchedApp: .init()
        )
        
        input.viewWillAppear
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, _ in
                    viewModel.useCase.fetchRecommendedApp()
                }
            )
            .disposed(by: disposeBag)
        
        input.searchBarText
            .distinctUntilChanged()
            .debounce(
                .milliseconds(500),
                scheduler: MainScheduler.instance
            )
            .withUnretained(self)
            .subscribe(
                onNext: { viewModel, text in
                    guard !text.isEmpty else {
                        output.searchedApp.onNext([])
                        return
                    }
                    viewModel.useCase.searchApp(
                        query: .init(term: text)
                    )
                }
            )
            .disposed(by: disposeBag)
        
        useCase.searchedApp
            .bind(to: output.searchedApp)
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
        let searchTermSuggestion: Observable<[String]>
        let recommendedApp: PublishSubject<[SearchAppMinResponse]>
        let searchedApp: PublishSubject<[SearchAppMidResponse]>
    }
}

#if DEBUG
import SwiftUI

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
