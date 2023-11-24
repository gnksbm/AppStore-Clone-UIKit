import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "BaseTabFeature",
    dependencies: [
        .todayFeature,
        .gameFeature,
        .applicationFeature,
        .arcadeFeature,
        .searchFeature
    ]
)
