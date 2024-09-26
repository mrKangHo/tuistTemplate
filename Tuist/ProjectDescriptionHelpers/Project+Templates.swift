
import ProjectDescription


extension Project {

    public static func makeProject(_ module:ModuleProtocol) -> Project {
        
        return Project(
            name: module.name,
            targets: [
                .target(
                    name: module.name,
                    destinations: module.destinations,
                    product: module.product,
                    bundleId: module.bundleId,
                    infoPlist: module.infoPlist,
                    sources: module.sources,
                    resources: module.resources,
                    dependencies: module.dependencies
                ),
                .target(
                    name: "\(module.name)Tests",
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: "\(module.bundleId)Tests",
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    resources: [],
                    dependencies: [.target(name: module.name)]
                ),
            ]
        )
        
    }

   
    
}

 
