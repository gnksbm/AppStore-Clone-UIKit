//
//  Feature.swift
//  ProjectDescriptionHelpers
//
//  Created by gnksbm on 2023/11/20.
//

import ProjectDescription

private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "Feature 모듈 템플릿",
    attributes: [
        nameAttribute,
    ],
    items: [
        // MARK: Project.swift
        .file(path: projectPath(with: "Project.swift"), templatePath: "project.stencil"),
        // MARK: Coordinator, ViewController, ViewModel
        .file(path: projectPath(with: "Sources/ViewModel/\(nameAttribute)ViewModel.swift"), templatePath: "viewModel.stencil"),
        .file(path: projectPath(with: "Sources/ViewController/\(nameAttribute)ViewController.swift"), templatePath: "viewContoller.stencil"),
        .file(path: projectPath(with: "Sources/Coordinator/\(nameAttribute)Coordinator.swift"), templatePath: "coordinator.stencil"),
        // MARK: UnitTests
        .file(path: projectPath(with: "Tests/\(nameAttribute)FeatureTests.swift"), templatePath: "tests.stencil"),
    ]
)

private func projectPath(with name: String) -> String {
    "Projects/Feature/\(nameAttribute)Feature/\(name)"
}
