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
//    // MARK: Refact
//    private static func makeTarget(targetKind: TargetKind,
//                                   name: String,
//                                   dependencies: [TargetDependency]) -> [Target] {
//        switch targetKind {
//        case .app:
//            return [
//                appTarget(name: name, dependencies: dependencies)
//            ]
//        case .framework:
//            return [
//                frameworkTarget(name: name, dependencies: dependencies),
//                unitTestTarget(name: name, dependencies: dependencies)
//            ]
//        case .feature:
//            var targets: [Target] = []
//            let demo = demoAppTarget(
//                name: name,
//                isFeature: true,
//                dependencies: dependencies
//            )
//            targets.append(demo)
//            let framework = frameworkTarget(
//                name: name,
//                isFeature: true,
//                dependencies: dependencies
//            )
//            targets.append(framework)
//            let unitTest = unitTestTarget(
//                name: name,
//                isFeature: true,
//                dependencies: dependencies
//            )
//            targets.append(unitTest)
//            return targets
//            return [
//                demoAppTarget(
//                    name: name,
//                    isFeature: true,
//                    dependencies: dependencies
//                ),
//                frameworkTarget(
//                    name: name,
//                    isFeature: true,
//                    dependencies: dependencies
//                ),
//                unitTestTarget(
//                    name: name,
//                    isFeature: true,
//                    dependencies: dependencies
//                )
//            ]
//        }
//    }
//    public static func module(
//        name: String,
//        targetKinds: TargetKind,
//        resources: ResourceFileElements? = nil,
//        dependencies: [TargetDependency] = []
//    ) -> Self {
//        var targets: [Target] = []
//        targets = {
//            switch targetKinds {
//            case .app:
//                return [
//                    appTarget(name: name, dependencies: dependencies)
//                ]
//            case .framework:
//                return [
//                    frameworkTarget(name: name, dependencies: dependencies),
//                    unitTestTarget(name: name, dependencies: dependencies)
//                ]
//            case .feature:
//                return [
//                    demoAppTarget(
//                        name: name,
//                        isFeature: true,
//                        dependencies: dependencies
//                    ),
//                    frameworkTarget(
//                        name: name,
//                        isFeature: true,
//                        dependencies: dependencies
//                    ),
//                    unitTestTarget(
//                        name: name,
//                        isFeature: true,
//                        dependencies: dependencies
//                    )
//                ]
//            }
//        }()
//        return Project(name: name,
//                organizationName: .organizationName,
//                targets: targets
//        )
//    }
//
//    private static func appTarget(
//        name: String,
//        isFeature: Bool = false,
//        dependencies: [TargetDependency]
//    ) -> Target {
//        let target: Target = .init(
//            name: name,
//            platform: .iOS,
//            product: .app,
//            bundleId: .bundleIDPrefix,
//            deploymentTarget: .current,
//            infoPlist: .current,
//            sources: ["Sources/**"],
//            resources: ["Resources/**"],
////            entitlements: <#T##Path?#>,
//            scripts: isFeature ? [.swiftLint] : [.featureSwiftLint],
//            dependencies: dependencies,
//            settings: .secret
//        )
//        return target
//    }
//
//    private static func demoAppTarget(
//        name: String,
//        isFeature: Bool = false,
//        dependencies: [TargetDependency]
//    ) -> Target {
//        let target: Target = .init(
//            name: name,
//            platform: .iOS,
//            product: .app,
//            bundleId: .bundleIDPrefix + ".DemoApp",
//            deploymentTarget: .current,
//            infoPlist: .current,
//            sources: ["Sources/**"],
//            resources: ["Resources/**"],
////            entitlements: <#T##Path?#>,
//            scripts: isFeature ? [.swiftLint] : [.featureSwiftLint],
//            dependencies: dependencies,
//            settings: .secret
//        )
//        return target
//    }
//
//    private static func frameworkTarget(
//        name: String,
//        isFeature: Bool = false,
//        dependencies: [TargetDependency]
//    ) -> Target {
//        let target: Target = .init(
//            name: name,
//            platform: .iOS,
//            product: .framework,
//            bundleId: .bundleIDPrefix,
//            deploymentTarget: .current,
//            infoPlist: .current,
//            sources: ["Sources/**"],
////            entitlements: <#T##Path?#>,
//            scripts: isFeature ? [.swiftLint] : [.featureSwiftLint],
//            dependencies: dependencies,
//            settings: .secret
//        )
//        return target
//    }
//
//    private static func unitTestTarget(
//        name: String,
//        isFeature: Bool = false,
//        dependencies: [TargetDependency]
//    ) -> Target {
//        let target: Target = .init(
//            name: name,
//            platform: .iOS,
//            product: .unitTests,
//            bundleId: .bundleIDPrefix + ".\(name)Test",
//            deploymentTarget: .current,
//            infoPlist: .current,
//            sources: ["Tests/**"],
////            entitlements: <#T##Path?#>,
//            scripts: isFeature ? [.swiftLint] : [.featureSwiftLint],
//            dependencies: dependencies,
//            settings: .secret
//        )
//        return target
//    }
}
