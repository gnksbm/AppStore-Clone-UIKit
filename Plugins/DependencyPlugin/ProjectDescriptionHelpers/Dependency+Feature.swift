//
//  Dependency+Feature.swift
//  DependencyPlugin
//
//  Created by gnksbm on 2023/11/24.
//

import ProjectDescription

public extension Array<TargetDependency> {
    enum Feature: CaseIterable {
        case today, game, application, arcade, search, detail
        
        public var dependency: TargetDependency {
            switch self {
            case .today:
                return featureModule(name: "TodayFeature")
            case .game:
                return featureModule(name: "GameFeature")
            case .application:
                return featureModule(name: "ApplicationFeature")
            case .arcade:
                return featureModule(name: "ArcadeFeature")
            case .search:
                return featureModule(name: "SearchFeature")
            case .detail:
                return featureModule(name: "DetailFeature")
            }
        }
        
        private func featureModule(name: String) -> TargetDependency {
            .project(target: name, path: .relativeToRoot("Projects/Feature/\(name)"))
        }
    }
}
