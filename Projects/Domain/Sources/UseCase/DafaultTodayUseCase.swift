//
//  DafaultTodayUseCase.swift
//  Domain
//
//  Created by gnksbm on 2023/12/02.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public final class DafaultTodayUseCase: TodayUseCase {
    private let applicationRepository: ApplicationRepository
    private let randomWordRepository: RandomWordRepository
    
    public init(applicationRepository: ApplicationRepository,
                randomWordRepository: RandomWordRepository
    ) {
        self.applicationRepository = applicationRepository
        self.randomWordRepository = randomWordRepository
    }
    
    public func fetchTodayApp() -> Observable<[ApplicationData]> {
//        applicationRepository.searchApp(query: .init(term: <#T##String#>))
        randomWordRepository.getWords(query: .init(count: 1))
        return .just([])
    }
}
