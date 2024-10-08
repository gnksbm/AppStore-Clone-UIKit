//
//  SearchAppMinResponse.swift
//  Domain
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

public struct SearchAppMinResponse: Hashable {
    public let iconUrl: URL?
    public let appID: Int
    public let appName: String
    public let appDescription: String
    
    public init(
        iconUrl: URL?,
        appID: Int,
        appName: String,
        appDescription: String
    ) {
        self.iconUrl = iconUrl
        self.appID = appID
        self.appName = appName
        self.appDescription = appDescription
    }
}
