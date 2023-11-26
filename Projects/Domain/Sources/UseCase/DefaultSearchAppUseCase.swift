//
//  DefaultSearchAppUseCase.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import RxSwift

public final class DefaultSearchAppUseCase: SearchAppUseCase {
    private let repository: ApplicationRepository
    
    public init(repository: ApplicationRepository) {
        self.repository = repository
    }
    
    public func searchApp(query: SearchQuery) async -> Observable<[ApplicationData]> {
        return await repository.searchApp(query: query)
    }
}
