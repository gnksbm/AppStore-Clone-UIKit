//
//  MockApplicationRepository.swift
//  FeatureDependency
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

import RxSwift

class MockApplicationRepository: ApplicationRepository {
    func searchApp(query: SearchQuery) -> Observable<[ApplicationData]> {
        .just([])
    }
}
