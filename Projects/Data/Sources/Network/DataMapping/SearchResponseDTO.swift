//
//  SearchResponseDTO.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/16.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation
import Domain

struct SearchResponseDTO: Codable {
    let resultCount: Int
    let results: [SearchResultDTO]
}

extension SearchResponseDTO {
    func toDomain() -> [ApplicationData] {
        results.map { .init(appName: $0.trackName) }
    }
}
