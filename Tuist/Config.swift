//
//  Config.swift
//  Clone_AppStoreManifests
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToRoot("Plugins/EnvironmentPlugin")),
        .local(path: .relativeToRoot("Plugins/DependencyPlugin")),
//        .local(path: .relativeToRoot("Plugins/ConfigPlugin")),
//        .local(path: .relativeToRoot("Plugins/EnvPlugin"))
    ],
    generationOptions: .options()
)

