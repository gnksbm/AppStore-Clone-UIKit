import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project.module(
//    name: "Domain",
//    productKind: [.app, .unitTest]
//)
let project = Project.module(
    name: "Domain",
    dependencies: [
        .core,
    ]
)
