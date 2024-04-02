//
//  XCConfig.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension Settings {
    static let secret: Self = .settings(
        base: .init()
            .setUserScriptSandboxing(),
        configurations: [
            .debug(name: .debug, xcconfig: .relativeToRoot("Config/Secrets.xcconfig")),
            .release(name: .release, xcconfig: .relativeToRoot("Config/Secrets.xcconfig")),
        ]
    )
}

extension SettingsDictionary {
    func setUserScriptSandboxing() -> SettingsDictionary {
        merging(
            [
                "ENABLE_USER_SCRIPT_SANDBOXING": .string("NO"),
            ]
        )
    }
}
