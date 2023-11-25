import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "ApplicationFeature",
    targetKinds: [.feature],
    dependencies: [
        .featureDependency
    ]
)
