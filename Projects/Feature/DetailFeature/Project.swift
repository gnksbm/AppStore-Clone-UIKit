import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "DetailFeature",
    targetKinds: .feature,
    isTestable: true,
    dependencies: [
        .featureDependency
    ]
)
