import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "Data",
    dependencies: [
        .Project.domain.dependency
    ]
)
