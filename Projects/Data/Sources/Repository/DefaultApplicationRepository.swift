//
//  DefaultApplicationRepository.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

import RxSwift

public final class DefaultApplicationRepository: ApplicationRepository {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func searchApp(
        request: SearchAppRequest
    ) -> Observable<[SearchAppMinResponse]> {
        networkService.request(
            endPoint: SearchEndPoint(query: request)
        )
        .decode(
            type: SearchAppDTO.self,
            decoder: JSONDecoder()
        )
        .map { $0.toAppMinimun() }
    }
}
