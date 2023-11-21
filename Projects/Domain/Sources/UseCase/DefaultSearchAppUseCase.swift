//
//  DefaultSearchAppUseCase.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift

final class DefaultSearchAppUseCase: SearchAppUseCase {
    private let repository: ApplicationRepository
    
    init(repository: ApplicationRepository) {
        self.repository = repository
    }
    
    func searchApp(query: SearchQuery) async -> Observable<[ApplicationData]> {
        let result = await repository.searchApp(query: query)
        switch result {
        case .success(let appData):
            return Observable.just(appData)
        case .failure:
            return Observable.just([])
        }
    }
}
