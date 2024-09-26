
import ProjectDescription


public protocol ModuleProtocol {
    var name: String { get }
    var destinations:Destinations { get }
    var product:Product { get }
    var bundleId:String { get }
    var infoPlist:InfoPlist { get }
    var sources:SourceFilesList? { get }
    var resources:ResourceFileElements? { get }
    var dependencies:[TargetDependency] { get }
}

public enum Module {
    
    case App
    case Core
    case Data
    case Domain
    case ThirdParty
}

public extension Module {
    enum Feature {
        case Home
        case Search
        case MyPage
    }
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
        case .ThirdParty:
            return "ThirdParty"
        }
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
        case .ThirdParty:
            return .framework
        }
    }
    
    public var bundleId: String {
        return "io.tuist.\(self.name)"
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
        case .ThirdParty:
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
        case .App:
            return [Module.Feature.Home.target,
                    Module.Feature.Search.target,
                    Module.Feature.MyPage.target]
        case .Core:
            return []
        case .Data:
            return []
        case .Domain:
            return []
        case .ThirdParty:
            return [.external(name: "Lottie")]
        }
    }
    
    
}
