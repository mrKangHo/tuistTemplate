
import ProjectDescription


extension Project {

    public static func makeProject(_ module:ModuleProtocol) -> Project {
        var targets:[Target] = []
        
        targets.append(Target.target(
            name: module.name,
            destinations: module.destinations,
            product: module.product,
            bundleId: module.bundleId,
            deploymentTargets: ENV.deploymentTarget,
            infoPlist: module.infoPlist,
            sources: module.sources,
            resources: module.resources,
            dependencies: module.dependencies
        ))
        
        if module.includeTesting {
            targets.append(.target(
                name: "\(module.name)Tests",
                destinations: module.destinations,
                product: .unitTests,
                bundleId: "\(module.bundleId)Tests",
                deploymentTargets: ENV.deploymentTarget,
                infoPlist: .default,
                sources: ["Tests/**"],
                resources: [],
                dependencies: [.target(name: module.name)]
            ))
        }
        
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)
        
        let scheme = Scheme.scheme(name: module.name,
                                   shared: true,
                                   hidden: false,
                                   buildAction: .buildAction(targets: ["\(module.name)"]),
                                   testAction: module.includeTesting ? .targets(
                                    ["\(module.name)Tests"],
                                    configuration: .debug,
                                    options: .options(coverage: true, codeCoverageTargets: ["\(module.name)"])
                                   ) : nil,
                                   runAction: .runAction(configuration: .debug),
                                   archiveAction: .archiveAction(configuration: .release),
                                   profileAction: .profileAction(configuration: .debug),
                                   analyzeAction: .analyzeAction(configuration: .debug))
        
        
        return Project(name: module.name,
                       organizationName: ENV.organizationName,
                       settings: settings,
                       targets: targets,
                       schemes: [scheme],
                       resourceSynthesizers: module.resourceSynthesizers)
        
    }

   
    
}

 
