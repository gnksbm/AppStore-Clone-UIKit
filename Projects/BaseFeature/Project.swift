import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "BaseFeature",
    dependencies: [
        .Project.domain.dependency
    ]
)