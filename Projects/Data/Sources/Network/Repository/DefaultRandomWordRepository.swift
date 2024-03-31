//
//  DefaultRandomWordRepository.swift
//  Data
//
//  Created by gnksbm on 2023/11/27.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

import RxSwift

public final class DefaultRandomWordRepository: RandomWordRepository {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func getWords(query: RandomWordQuery) -> Observable<[String]> {
        networkService.request(endPoint: RandomWordEndPoint(query: query))
            .decode(type: [String].self, decoder: JSONDecoder())
            .map { $0 }
    }
}
