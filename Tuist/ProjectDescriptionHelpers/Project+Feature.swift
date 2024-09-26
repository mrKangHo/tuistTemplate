import ProjectDescription

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
        return "io.tuist.\(self.name)"
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
            return [Module.Core.target,
                    Module.Data.target,
                    Module.Domain.target,
                    Module.ThirdParty.target]
        case .Search:
            return [Module.Core.target,
                    Module.Data.target,
                    Module.Domain.target,
                    Module.ThirdParty.target]
        case .MyPage:
            return [Module.Core.target,
                    Module.Data.target,
                    Module.Domain.target,
                    Module.ThirdParty.target]
        }
    }
    
     
}
