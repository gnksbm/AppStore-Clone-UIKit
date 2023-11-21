//
//  Project+Templates.swift
//  Config
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription
import EnvironmentPlugin
import DependencyPlugin

extension Project {
    public static func module(
        name: String,
        productKind: Product = .framework,
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency]
    ) -> Self {
        Project(name: name,
                organizationName: .organizationName,
                targets: makeAppTargets(
                    name: name,
                    productKind: productKind,
                    resources: resources,
                    dependencies: dependencies
                )
        )
    }
    
    private static func makeAppTargets(
        name: String,
        productKind: Product,
        isTestable: Bool = false,
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let source: Target = .init(
            name: name,
            platform: .iOS,
            product: productKind,
            bundleId: .bundleIDPrefix + "\(name)",
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
            resources: resources,
//            entitlements: <#T##Path?#>,
            scripts: [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return [source]
    }
    // MARK: Refact
    public static func module(
        name: String,
        productKind: [TargetModule],
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Self {
        var targets: [Target] = []
        targets = productKind.map {
            switch $0 {
            case .app:
                return appTarget(name: name, dependencies: dependencies)
            case .framework:
                return frameworkTarget(name: name, dependencies: dependencies)
            case .unitTest:
                return unitTestTarget(name: name, dependencies: dependencies)
            }
        }
        return Project(name: name,
                organizationName: .organizationName,
                targets: targets
        )
    }
    
    private static func appTarget(
        name: String,
        dependencies: [TargetDependency]
    ) -> Target {
        let target: Target = .init(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: .bundleIDPrefix,
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
//            entitlements: <#T##Path?#>,
            scripts: [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return target
    }
    
    private static func frameworkTarget(
        name: String,
        dependencies: [TargetDependency]
    ) -> Target {
        let target: Target = .init(
            name: name,
            platform: .iOS,
            product: .framework,
            bundleId: .bundleIDPrefix + ".\(name)",
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
//            entitlements: <#T##Path?#>,
            scripts: [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return target
    }
    
    private static func unitTestTarget(
        name: String,
        dependencies: [TargetDependency]
    ) -> Target {
        let target: Target = .init(
            name: name,
            platform: .iOS,
            product: .unitTests,
            bundleId: .bundleIDPrefix + ".unitTest",
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
//            entitlements: <#T##Path?#>,
            scripts: [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return target
    }
}
