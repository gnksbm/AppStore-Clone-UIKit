//
//  Dependencies.swift
//  Config
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

import DependencyPlugin

let spm = SwiftPackageManagerDependencies(
    .thirdPartyRemote,
    productTypes: .thirdPartyTypes
)

let carthage = CarthageDependencies(
    [
    ]
)

let dependencies = Dependencies(
    carthage: carthage,
    swiftPackageManager: spm,
    platforms: [.iOS]
)

