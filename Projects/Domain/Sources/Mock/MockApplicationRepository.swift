//
//  MockApplicationRepository.swift
//  Domain
//
//  Created by gnksbm on 2023/12/02.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public final class MockApplicationRepository: ApplicationRepository {
    public init() { }
    
    public func searchApp(query: SearchQuery) -> RxSwift.Observable<[ApplicationData]> {
        .just([])
    }
}
