import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "App",
    productKind: .app,
    resources: ["Resources/**"],
    dependencies: [
        .Project.thirdPartyLibs.dependency
    ]
)
