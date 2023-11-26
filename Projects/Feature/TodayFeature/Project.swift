import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "TodayFeature",
    targetKinds: .feature,
    isTestable: true,
    dependencies: [
        .featureDependency
    ]
)
