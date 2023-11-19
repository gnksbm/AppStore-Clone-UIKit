//
//  InfoPlist.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/19.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import ProjectDescription

extension InfoPlist.Value {
    fileprivate static var version: Self = "1"
    fileprivate static var shortVersion: Self = "1.0"
}

extension InfoPlist {
    public static let current: Self = .extendingDefault(with: [
        "BundleDisplayName": "AppStore",
        "CFBundleShortVersionString": .shortVersion,
        "CFBundleVersion": .version,
        "UILaunchStoryboardName": "LaunchScreen",
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ],
    ])
}

extension Project {
    static let infoPlist: [String: InfoPlist.Value] = [
        "BundleDisplayName": "AppStore",
        "CFBundleShortVersionString": .shortVersion,
        "CFBundleVersion": .version,
        "UILaunchStoryboardName": "LaunchScreen",
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ],
    ]
}
