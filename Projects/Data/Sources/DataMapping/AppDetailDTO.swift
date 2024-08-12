//
//  AppDetailDTO.swift
//  Data
//
//  Created by gnksbm on 8/11/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import Domain

struct AppDetailDTO: Codable {
    let resultCount: Int
    let results: [Result]
}

extension AppDetailDTO {
    func toDomain() -> [AppDetailResponse] {
        results.map { dto in
            AppDetailResponse(
                iconUrl: URL(string: dto.artworkUrl100),
                appName: dto.trackName,
                appSellerName: dto.sellerName,
                latestVersion: dto.version,
                releaseNote: dto.releaseNotes,
                screenshotUrls: dto.screenshotUrls
                    .compactMap { URL(string: $0) },
                appDescription: dto.description
            )
        }
    }
}

extension AppDetailDTO {
    struct Result: Codable {
        let screenshotUrls: [String]
        let artworkUrl60, artworkUrl512, artworkUrl100: String
        let artistViewURL: String
        let isGameCenterEnabled: Bool
        let supportedDevices: [String]
        let kind, minimumOSVersion: String
        let averageUserRatingForCurrentVersion, averageUserRating: Double
        let trackCensoredName: String
        let languageCodesISO2A: [String]
        let fileSizeBytes: String
        let sellerURL: String?
        let formattedPrice, contentAdvisoryRating: String
        let userRatingCountForCurrentVersion: Int
        let trackViewURL: String
        let trackContentRating, currency, releaseNotes, sellerName: String
        let description: String
        let genreIDS: [String]
        let isVppDeviceBasedLicensingEnabled: Bool
        let trackID: Int
        let trackName, bundleID: String
        let currentVersionReleaseDate: String
        let primaryGenreName: String
        let primaryGenreID: Int
        let releaseDate: String
        let artistID: Int
        let artistName: String
        let genres: [String]
        let price: Int
        let version, wrapperType: String
        let userRatingCount: Int
        
        enum CodingKeys: String, CodingKey {
            case screenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100
            case artistViewURL = "artistViewUrl"
            case isGameCenterEnabled, supportedDevices, kind
            case minimumOSVersion = "minimumOsVersion"
            case averageUserRatingForCurrentVersion, averageUserRating, 
                 trackCensoredName, languageCodesISO2A, fileSizeBytes
            case sellerURL = "sellerUrl"
            case formattedPrice, contentAdvisoryRating, 
                 userRatingCountForCurrentVersion
            case trackViewURL = "trackViewUrl"
            case trackContentRating, currency, releaseNotes, sellerName, 
                 description
            case genreIDS = "genreIds"
            case isVppDeviceBasedLicensingEnabled
            case trackID = "trackId"
            case trackName
            case bundleID = "bundleId"
            case currentVersionReleaseDate, primaryGenreName
            case primaryGenreID = "primaryGenreId"
            case releaseDate
            case artistID = "artistId"
            case artistName, genres, price, version, wrapperType, 
                 userRatingCount
        }
    }
}
