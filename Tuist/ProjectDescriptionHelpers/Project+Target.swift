//
//  Scripts.swift
//  ProjectDescriptionHelpers
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

public enum TargetModule {
    case app, framework, unitTest
    
    var product: Product {
        switch self {
        case .app:
            return .app
        case .framework:
            return .framework
        case .unitTest:
            return .unitTests
        }
    }
}
