//
//  MockRandomWordRepository.swift
//  Domain
//
//  Created by gnksbm on 2023/12/13.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public final class MockRandomWordRepository: RandomWordRepository {
    public init() { }
    
    public func getWords(query: RandomWordQuery) -> RxSwift.Observable<[String]> {
        .just([])
    }
}
