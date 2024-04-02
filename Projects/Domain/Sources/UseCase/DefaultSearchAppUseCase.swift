//
//  DefaultSearchAppUseCase.swift
//  Domain
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

public final class DefaultSearchAppUseCase: SearchAppUseCase {
    private let applicationRepository: SearchAppRepository
    private let randomWordRepository: RandomWordRepository
    
    public let searchedApp = PublishSubject<[SearchAppMidResponse]>()
    public let recommendedApp = PublishSubject<[SearchAppMinResponse]>()
    private let disposeBag = DisposeBag()
    
    public init(
        searchAppRepository: SearchAppRepository,
        randomWordRepository: RandomWordRepository
    ) {
        self.applicationRepository = searchAppRepository
        self.randomWordRepository = randomWordRepository
    }
    
    public func searchApp(query: SearchAppRequest) {
        applicationRepository.searchApp(request: query)
            .withUnretained(self)
            .subscribe(
                onNext: { useCase, responses in
                    useCase.searchedApp.onNext(responses)
                }
            )
            .disposed(by: disposeBag)
    }
    
    public func fetchRandomWords(query: RandomWordRequest) -> Observable<[String]> {
        randomWordRepository.getWords(request: query)
    }
    
    public func fetchRecommendedApp() {
        applicationRepository.searchApp(
            request: .init(
                term: "카카오",
                limit: 16
            )
        )
        .withUnretained(self)
        .subscribe(
            onNext: { useCase, responses in
                useCase.recommendedApp.onNext(responses)
            }
        )
        .disposed(by: disposeBag)
    }
}
