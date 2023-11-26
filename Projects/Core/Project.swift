import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
    name: "Core",
    targetKinds: .framework,
    dependencies: [
        .thirdPartyLibs
    ]
)
