//
//  MockRandomWordRepository.swift
//  FeatureDependency
//
//  Created by gnksbm on 3/31/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

import RxSwift

class MockRandomWordRepository: RandomWordRepository {
    func getWords(query: RandomWordQuery) -> Observable<[String]> {
        .just([
            "test1",
            "test2",
            "test3",
            "test4",
            "test5",
            "test6",
        ])
    }
}
