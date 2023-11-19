//
//  DefaultSearchAppUseCase.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

final class DefaultSearchAppUseCase: SearchAppUseCase {
    private let repository: ApplicationRepository
    
    init(repository: ApplicationRepository) {
        self.repository = repository
    }
    
//    func searchApp(query: SearchQuery) async -> Result<[ApplicationData], NetworkError> {
//        let result = await repository.searchApp(query: query)
//        switch result {
//        case .success(let data):
//            do {
//                let dto = try JSONDecoder().decode(SearchResponseDTO.self, from: data)
//                return .success(dto.toDomain())
//            } catch {
//                return .failure(.parseError)
//            }
//        case .failure(let error):
//            return .failure(error)
//        }
//    }
}
