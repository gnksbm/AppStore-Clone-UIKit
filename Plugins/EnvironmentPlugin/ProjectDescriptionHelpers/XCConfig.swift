//
//  XCConfig.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension Settings {
    static let secret: Self = .settings(configurations: [
        .debug(name: "Debug", xcconfig: .relativeToRoot("Config/Secrets.xcconfig")),
        .release(name: "Release", xcconfig: .relativeToRoot("Config/Secrets.xcconfig")),
    ])
}
