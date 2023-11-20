//
//  Feature.swift
//  ProjectDescriptionHelpers
//
//  Created by gnksbm on 2023/11/20.
//

import ProjectDescription

let nameAttribute = Template.Attribute.required("name")

let template = Template(
    description: "Feature 모듈 템플릿",
    attributes: [
        nameAttribute,
    ],
    items: [
        .file(path: projectPath(with: "Project.swift"), templatePath: "project.stencil"),
        .string(path: projectPath(with: "Sources/Temp.swift"), contents: "//")
    ]
)

func projectPath(with: String) -> String {
    "Projects/\(nameAttribute)/" + with
}
