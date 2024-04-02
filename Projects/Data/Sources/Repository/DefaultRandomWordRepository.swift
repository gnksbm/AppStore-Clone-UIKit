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
    
    public func getWords(request: RandomWordRequest) -> Observable<[String]> {
//        networkService.request(endPoint: RandomWordEndPoint(query: request))
//            .decode(type: [String].self, decoder: JSONDecoder())
//            .map { $0 }
        .just([
            "버스어디",
            "토스",
            "카카오",
            "네이버",
            "유튜브",
            "인스타그램",
        ])
    }
}
