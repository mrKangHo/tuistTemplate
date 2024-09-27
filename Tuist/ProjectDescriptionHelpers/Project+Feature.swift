import ProjectDescription

public extension Module {
    enum Feature {
        case Home
        case Search
        case MyPage
    }
}

extension Module.Feature:ModuleProtocol {
    public var name: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .MyPage:
            return "MyPage"
        }
    }
    public var includeTesting: Bool {
        return true
    }
    public var destinations: Destinations {
        return .iOS
    }
    
    public var product: Product {
        switch self {
        case .Home:
            return .framework
        case .Search:
            return .framework
        case .MyPage:
            return .framework
        }
    }
    
    public var bundleId: String {
        return "\(ENV.prefixBundleId).\(self.name)"
    }
    
    public var infoPlist: InfoPlist {
        switch self {
        case .Home:
            return .default
        case .Search:
            return .default
        case .MyPage:
            return .default
        }
    }
    
    public var sources: SourceFilesList? {
        return ["Sources/**"]
    }
    
    public var resources: ResourceFileElements? {
        return ["Resources/**"]
    }
    
    public var dependencies: [TargetDependency] {
        switch self {
        case .Home:
            return [Module.Data.target,
                    Module.Resources.target]
        case .Search:
            return [Module.Data.target,
                    Module.Resources.target]
        case .MyPage:
            return [Module.Data.target,
                    Module.Resources.target]
        }
    }
    
    public var resourceSynthesizers: [ResourceSynthesizer] {
        return .default
    }
    
     
}
