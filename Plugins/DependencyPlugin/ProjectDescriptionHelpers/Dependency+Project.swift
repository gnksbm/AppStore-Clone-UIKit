//
//  Dependency+Project.swift
//  Environment
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public extension TargetDependency {
    enum Project {
        case app, domain, data, thirdPartyLibs
        
        public var dependency: TargetDependency {
            switch self {
            case .app:
                return TargetDependency.projectDependency(name: "AppStore")
            case .domain:
                return TargetDependency.projectDependency(name: "Domain")
            case .data:
                return TargetDependency.projectDependency(name: "Data")
            case .thirdPartyLibs:
                return TargetDependency.projectDependency(name: "ThirdPartyLibs")
            }
        }
    }
    
    static func projectDependency(name: String) -> Self {
        .project(target: name, path: .relativeToRoot("Projects/\(name)"))
    }
}
