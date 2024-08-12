//
//  DefaultAppDetailRepository.swift
//  Data
//
//  Created by gnksbm on 8/12/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Core
import Domain

import RxSwift

public final class DefaultAppDetailRepository: AppDetailRepository {
    @Injected private var networkService: NetworkService
    
    public init() { }
    
    public func fetchDetailItem(
        request: AppDetailRequest
    ) -> Observable<AppDetailResponse> {
        networkService.request(
            endPoint: AppDetailEndpoint(
                request: request
            )
        )
        .decode(type: AppDetailDTO.self, decoder: JSONDecoder())
        .compactMap { $0.toDomain().first }
    }
}
