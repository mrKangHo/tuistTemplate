import ProjectDescription
import ProjectDescriptionHelpers

//let project = Project(
//    name: "Home",
//    targets: [
//        .target(
//            name: "Home",
//            destinations: .iOS,
//            product: .framework,
//            bundleId: "io.tuist.Home",
//            infoPlist: .default,
//            sources: ["Sources/**"],
//            resources: ["Resources/**"],
//            dependencies: [.project(target: "Core", path: .relativeToRoot("PRJ/Core")),
//                           .project(target: "Data", path: .relativeToRoot("PRJ/Data")),
//                                      .project(target: "Domain", path: .relativeToRoot("PRJ/Domain")),
//                                      .project(target: "ThirdParty", path: .relativeToRoot("PRJ/ThirdParty")),]
//        ),
//    ]
//)

let project = Project.makeProject(Module.Feature.Home)