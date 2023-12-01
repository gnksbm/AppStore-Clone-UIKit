//
//  DefaultSearchAppUseCase.swift
//  Domain
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift

public final class DefaultSearchAppUseCase: SearchAppUseCase {
    private let applicationRepository: ApplicationRepository
    private let randomWordRepository: RandomWordRepository
    
    public init(applicationRepository: ApplicationRepository,
                randomWordRepository: RandomWordRepository
    ) {
        self.applicationRepository = applicationRepository
        self.randomWordRepository = randomWordRepository
    }
    
    public func searchApp(query: SearchQuery) -> Observable<[ApplicationData]> {
        return applicationRepository.searchApp(query: query)
    }
    public func getRandomWords(query: RandomWordQuery) -> Observable<[String]> {
        randomWordRepository.getWords(query: query)
    }
}
