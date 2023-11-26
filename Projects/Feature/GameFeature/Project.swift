import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "GameFeature",
    targetKinds: .feature,
    isTestable: true,
    dependencies: [
        .featureDependency
    ]
)
