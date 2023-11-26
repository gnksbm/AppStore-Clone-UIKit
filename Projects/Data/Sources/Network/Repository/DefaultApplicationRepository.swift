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
    
//    public func searchApp(query: SearchQuery) async -> Result<[ApplicationData], Error> {
//        let endPoint = SearchEndPoint(query: query)
//        let result = await networkService.request(endPoint: endPoint)
//        switch result {
//        case .success(let data):
//            do {
//                let dto = try JSONDecoder().decode(SearchResponseDTO.self, from: data)
//                return .success(dto.toDomain())
//            } catch {
//                return .failure(NetworkError.parseError)
//            }
//        case .failure(let error):
//            return .failure(NetworkError.transportError(error))
//        }
//    }
    public func searchApp(query: SearchQuery) async -> Observable<[ApplicationData]> {
        let endPoint = SearchEndPoint(query: query)
        let result = await networkService.request(endPoint: endPoint)
        switch result {
        case .success(let data):
            do {
                let dto = try JSONDecoder().decode(SearchResponseDTO.self, from: data)
                return .just(dto.toDomain())
            } catch {
                return .error(NetworkError.parseError)
            }
        case .failure(let error):
            return .error(NetworkError.transportError(error))
        }
    }
}
