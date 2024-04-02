//
//  SearchAppMidResponse.swift
//  Domain
//
//  Created by gnksbm on 4/1/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public struct SearchAppMidResponse: Hashable {
    public let minResponse: SearchAppMinResponse
    public let averageRating: Double
    public let ratingCount: Int
    public let developerName: String
    public let genre: String?
    public let screenshotUrls: [URL]
    
    public init(
        minResponse: SearchAppMinResponse,
        averageRating: Double,
        ratingCount: Int,
        developerName: String,
        genre: String?,
        screenshotUrls: [URL]
    ) {
        self.minResponse = minResponse
        self.averageRating = averageRating
        self.ratingCount = ratingCount
        self.developerName = developerName
        self.genre = genre
        self.screenshotUrls = screenshotUrls
    }
}
