//
//  Environment.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension String {
    static let appName = "AppStore"
    static let organizationName = "https://github.com/gnksbm/Clone_AppStore"
//    static let bundleIDPrefix = "com.clone."
    static let bundleIDPrefix = "com.clone" + ".\(appName)"
}

public extension Platform {
    static let current: Self = .iOS
}

public extension DeploymentTarget {
    static let current: Self = .iOS(
        targetVersion: "16.0",
        devices: [.iphone],
        supportsMacDesignedForIOS: false
    )
}

extension InfoPlist.Value {
    static let appName: Self = .init(stringLiteral: .appName)
    static let version: Self = "1"
    static let shortVersion: Self = "1.0"
}
