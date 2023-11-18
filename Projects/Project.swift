import ProjectDescription

let projectName = "AppStore"
let orgName = "https://github.com/gnksbm/Clone_AppStore"
let bundleID = "com.clone.appstore"
let infoPlist: [String: InfoPlist.Value] = [
    "BundleDisplayName": "AppStore",
    "BundleShortVersionString": "1.0",
    "BundleVersion": "1.0.0",
    "UILaunchStoryboardName": "LaunchScreen",
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ],
            ]
        ]
    ],
]
    
let project = Project(
    name: projectName,
    organizationName: orgName,
    packages: [
    ],
    targets: [
        .init(
            name: projectName,
            platform: .iOS,
            product: .app,
            bundleId: bundleID,
            deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["\(projectName)/Sources/**"],
            resources: ["\(projectName)/Resources/**"],
            dependencies: [
            ]
        )
    ]
)
