import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "FeatureDependency",
    dependencies: [
        .domain,
        .designSystem
    ]
)
