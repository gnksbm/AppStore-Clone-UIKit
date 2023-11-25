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
    // MARK: Refact
    public static func makeProject(
        name: String,
        targetKinds: [TargetKind] = [],
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency]
    ) -> Self {
        var targets = [Target]()
        targets = targetKinds.flatMap {
            switch $0 {
            case .app:
                let app = appTarget(name: name, dependencies: dependencies)
                return [app]
            case .framework:
                let framework = frameworkTarget(name: name, dependencies: dependencies)
                let test = unitTestTarget(name: name, dependencies: dependencies)
                return [framework, test]
            case .feature:
                let demo = demoAppTarget(name: name, isFeature: true, dependencies: dependencies)
                let framework = frameworkTarget(name: name, isFeature: true, dependencies: dependencies)
                let test = unitTestTarget(name: name, dependencies: dependencies)
                return [demo, framework, test]
            }
        }
        return Project(name: name,
                organizationName: .organizationName,
                targets: targets
        )
    }
    
    private static func appTarget(
        name: String,
        isFeature: Bool = false,
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
            scripts: isFeature ? [.featureSwiftLint] : [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return target
    }

    private static func demoAppTarget(
        name: String,
        isFeature: Bool = false,
        dependencies: [TargetDependency]
    ) -> Target {
        let target: Target = .init(
            name: "\(name)DemoApp",
            platform: .iOS,
            product: .app,
            bundleId: .bundleIDPrefix + ".DemoApp",
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
//            entitlements: <#T##Path?#>,
            scripts: isFeature ? [.featureSwiftLint] : [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return target
    }

    private static func frameworkTarget(
        name: String,
        isFeature: Bool = false,
        dependencies: [TargetDependency]
    ) -> Target {
        let target: Target = .init(
            name: name,
            platform: .iOS,
            product: .framework,
            bundleId: .bundleIDPrefix,
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
//            entitlements: <#T##Path?#>,
            scripts: isFeature ? [.featureSwiftLint] : [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return target
    }
    
    private static func unitTestTarget(
        name: String,
        isFeature: Bool = false,
        dependencies: [TargetDependency]
    ) -> Target {
        return Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: .bundleIDPrefix + ".\(name)Test",
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Tests/**"],
            scripts: isFeature ? [.featureSwiftLint] : [.swiftLint]
        )
    }
    
    // MARK: Current
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
    
    public static func feature(
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
                    isFeature: true,
                    resources: resources,
                    dependencies: dependencies
                )
        )
    }
    
    private static func makeAppTargets(
        name: String,
        productKind: Product,
        isFeature: Bool = false,
        entitlements: Path? = nil,
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let appTarget: Target = .init(
            name: name,
            platform: .iOS,
            product: productKind,
            bundleId: productKind == .app ? .bundleIDPrefix : .bundleIDPrefix + "\(name)",
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
            resources: resources,
            entitlements: entitlements,
            scripts: isFeature ? [.featureSwiftLint] : [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        return [
            appTarget
        ]
    }
}
