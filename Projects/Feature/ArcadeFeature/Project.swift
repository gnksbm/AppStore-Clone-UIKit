import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "ArcadeFeature",
    targetKinds: [.feature],
    dependencies: [
        .featureDependency
    ]
)
