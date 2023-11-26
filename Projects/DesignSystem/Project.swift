import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "DesignSystem",
    targetKinds: .framework,
    hasResource: true,
    dependencies: [
        .core
    ]
)
