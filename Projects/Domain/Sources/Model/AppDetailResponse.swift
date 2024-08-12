//
//  AppDetailResponse.swift
//  Domain
//
//  Created by gnksbm on 8/11/24.
//  Copyright © 2024 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public struct AppDetailResponse {
    public let iconUrl: URL?
    public let appName: String
    public let appSellerName: String
    public let latestVersion: String
    public let releaseNote: String
    public let screenshotUrls: [URL]
    public let appDescription: String
    
    public init(
        iconUrl: URL?,
        appName: String,
        appSellerName: String,
        latestVersion: String,
        releaseNote: String,
        screenshotUrls: [URL],
        appDescription: String
    ) {
        self.iconUrl = iconUrl
        self.appName = appName
        self.appSellerName = appSellerName
        self.latestVersion = latestVersion
        self.releaseNote = releaseNote
        self.screenshotUrls = screenshotUrls
        self.appDescription = appDescription
    }
}
