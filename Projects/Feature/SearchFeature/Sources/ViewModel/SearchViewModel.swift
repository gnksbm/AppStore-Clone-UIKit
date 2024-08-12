import Foundation

import Core
import Domain
import FeatureDependency

import RxSwift
import RxCocoa

public final class SearchViewModel: ViewModel {
    @Injected private var useCase: SearchAppUseCase
    private var coordinator: SearchCoordinator
    private var disposeBag = DisposeBag()
    
    public init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }
    
    public func transform(input: Input) -> Output {
        let output = Output(
            searchTermSuggestion: useCase.fetchRandomWords(query: .init()),
            recommendedApp: useCase.recommendedApp,
            searchedApp: .init()
        )
        
        disposeBag.insert {
            input.viewWillAppear
                .withUnretained(self)
                .subscribe(
                    onNext: { viewModel, _ in
                        viewModel.useCase.fetchRecommendedApp()
                    }
                )
            
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
            
            input.itemTapEvent
                .withUnretained(self)
                .bind { vm, id in
                    vm.coordinator.startDetailFlow(id: id)
                }
            
            useCase.searchedApp
                .bind(to: output.searchedApp)
        }
        return output
    }
}

extension SearchViewModel {
    public struct Input {
        let viewWillAppear: Observable<Void>
        let searchBarText: Observable<String>
        let itemTapEvent: Observable<Int>
    }
    
    public struct Output {
        let searchTermSuggestion: Observable<[String]>
        let recommendedApp: PublishSubject<[SearchAppMinResponse]>
        let searchedApp: PublishSubject<[SearchAppMidResponse]>
    }
}
