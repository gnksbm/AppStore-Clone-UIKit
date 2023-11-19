//
//  Dependencies.swift
//  Config
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension SwiftPackageManagerDependencies {
    enum ThirdPartyLibs: CaseIterable {
        case rxSwift
    }
}

let spm = SwiftPackageManagerDependencies(
    [
        .remote(url: "https://github.com/ReactiveX/RxSwift", requirement: .upToNextMinor(from: "6.0.0")),
    ]
)

let carthage = CarthageDependencies(
    []
)

let dependencies = Dependencies(
    carthage: carthage,
    swiftPackageManager: spm,
    platforms: [.iOS]
)

