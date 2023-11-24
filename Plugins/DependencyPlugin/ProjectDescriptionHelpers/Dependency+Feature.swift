//
//  Dependency+Feature.swift
//  DependencyPlugin
//
//  Created by gnksbm on 2023/11/24.
//

import ProjectDescription

public extension TargetDependency {
    static let todayFeature: Self = .featureModule(name: "TodayFeature")
    static let gameFeature: Self = .featureModule(name: "GameFeature")
    static let applicationFeature: Self = .featureModule(name: "ApplicationFeature")
    static let arcadeFeature: Self = .featureModule(name: "ArcadeFeature")
    static let searchFeature: Self = .featureModule(name: "SearchFeature")
    
    private static func featureModule(name: String) -> Self {
        .project(target: name, path: .relativeToRoot("Projects/Feature/\(name)"))
    }
}
