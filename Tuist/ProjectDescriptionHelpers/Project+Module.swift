
import ProjectDescription




public enum Module {
    
    case App
    case Core
    case Data
    case Domain
    case Resources
    case ThirdParty
}




extension Module: ModuleProtocol {
    public var name: String {
        switch self {
        case .App:
            return "App"
        case .Core:
            return "Core"
        case .Data:
            return "Data"
        case .Domain:
            return "Domain"
        case .Resources:
            return "Resources"
        case .ThirdParty:
            return "ThirdParty"
        }
    }
    
    public var includeTesting: Bool {
        return false
    }
    
    public var destinations: Destinations {
        return .iOS
    }
    
    public var product: Product {
        switch self {
        case .App:
            return .app
        case .Core:
            return .framework
        case .Data:
            return .framework
        case .Domain:
            return .framework
        case .Resources:
            return .framework
        case .ThirdParty:
            return .framework
        }
    }
    
    public var bundleId: String {
        return "\(ENV.prefixBundleId).\(self.name)"
    }
    
    public var infoPlist: InfoPlist {
        switch self {
        case .App:
            return .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            )
        case .Core:
            return .default
        case .Data:
            return .default
        case .Domain:
            return .default
        case .Resources:
            return .default
        case .ThirdParty:
            return .default
        }
    }
    
    public var sources: SourceFilesList? {
        
        switch self {
        case .App:
            return ["Sources/**"]
        case .Core:
            return ["Sources/**"]
        case .Data:
            return ["Sources/**"]
        case .Domain:
            return ["Sources/**"]
        case .Resources:
            return ["Sources/**"]
        case .ThirdParty:
            return ["Sources/**"]
        }
        
    }
    
    public var resources: ResourceFileElements? {
        return ["Resources/**"]
    }
    
    public var dependencies: [TargetDependency] {
        switch self {
        case .App:
            return [Module.Feature.Home.target,
                    Module.Feature.Search.target,
                    Module.Feature.MyPage.target]
        case .Core:
            return []
        case .Data:
            return [Module.Core.target,
                    Module.Domain.target]
        case .Domain:
            return [Module.Core.target]
        case .Resources:
            return [.SPM.Lottie]
        case .ThirdParty:
            return []
        }
    }
    
    public var resourceSynthesizers: [ResourceSynthesizer] {
        switch self {
        case .App:
            return .default
        case .Core:
            return .default
        case .Data:
            return .default
        case .Domain:
            return .default
        case .Resources:
            return [.custom(name: "Lottie", parser: .json, extensions: ["lottie"])]
        case .ThirdParty:
            return .default
        }
    }
    
    
}
