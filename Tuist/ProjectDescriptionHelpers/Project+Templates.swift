
import ProjectDescription


extension Project {
    

    public static func makeModule(_ module: ModuleNames) -> Project {
        
        var targets: [Target] = []
        
        targets.append(self.makeTarget(module))
        
        if module.includeTesting {
            targets.append(self.makeTestTarget(module))
        }
        
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)

        
        
        return Project(
            name: module.name,
            organizationName: ENV.organizationName,
            packages: module.packages,
            settings: settings,
            targets: targets,
            schemes: [makeScheme(module)],
            resourceSynthesizers: module.resourceSynthesizers
        )
        
    }
    
    
    static func makeTarget(_ module: ModuleNames) -> Target {
        return Target.target(name: module.name,
                             destinations: module.destination,
                             product: module.productType,
                             bundleId: ENV.bundleId + "." + module.name,
                             deploymentTargets: ENV.deploymentTarget,
                             infoPlist: module.infoPlist,
                             sources: module.sources,
                             resources: module.resources,
                             dependencies: module.dependencies)
    }
    
    static func makeTestTarget(_ module: ModuleNames) -> Target {
        return Target.target(name: "\(module.name)Tests",
                             destinations: module.destination,
                             product: .unitTests,
                             bundleId: ENV.bundleId + "." + module.name + "Tests",
                             infoPlist: .default,
                             sources: ["Tests/**"],
                             dependencies: [.target(name: module.name)])
    }
    
    static func makeScheme(_ module: ModuleNames) -> Scheme {
        
        var testAction:TestAction?
        if module.includeTesting {
            testAction = .targets(
                ["\(module.name)Tests"],
                configuration: .debug,
                options: .options(coverage: true,
                                  codeCoverageTargets: ["\(module.name)"])
             )
        }
        
        return Scheme.scheme(name: module.name,
                             shared: true,
                             hidden: false,
                             buildAction: .buildAction(targets: ["\(module.name)"]),
                             testAction: testAction,
                             runAction: .runAction(configuration: .debug),
                             archiveAction: .archiveAction(configuration: .debug),
                             profileAction: .profileAction(configuration: .debug),
                             analyzeAction: .analyzeAction(configuration: .debug))
    }
    
    
    
    
    
    
}
