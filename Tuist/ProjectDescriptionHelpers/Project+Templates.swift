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
        var targets: [Target] = []
        let source: Target = .init(
            name: name,
            platform: .iOS,
            product: productKind,
            bundleId: .bundleIDPrefix + ".\(name)",
            deploymentTarget: .current,
            infoPlist: .current,
            sources: ["Sources/**"],
            resources: resources,
//            entitlements: <#T##Path?#>,
//            scripts: [.swiftLint],
            dependencies: dependencies,
            settings: .secret
        )
        targets.append(source)
        return targets
    }
}
