//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by gnksbm on 2023/11/19.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "ThirdPartyLibs",
    dependencies: [
        .SPM.rxSwift.external
    ]
)
