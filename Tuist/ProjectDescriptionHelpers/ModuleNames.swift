
import ProjectDescription


public enum ModuleNames {
    case App
    case ThirdPartyLib
}

public extension ModuleNames {
    var name: String {
        switch self {
        case .App: return "App"
        case .ThirdPartyLib: return "ThirdPartyLib"
        
        }
    }
    
    var destination: Destinations {
        return [.iPhone, .iPad]
    }
    
    var productType:Product {
        switch self {
        case .App: return .app
        case .ThirdPartyLib: return .framework
        }
    }
    
    var sources:SourceFilesList {
        return ["Sources/**"]
    }
    
    var resources:ResourceFileElements {
        return ["Resources/**"]
    }
    
    var infoPlist:InfoPlist? {
        switch self {
        case .App: return .default
        case .ThirdPartyLib: return .default
        }
    }
    
    var dependencies: [TargetDependency] {
        switch self {
        case .App: return []
        case .ThirdPartyLib: return [.SPM.TCA]
        }
    }
    
    var includeTesting: Bool {
        switch self {
        case .App: return false
        case .ThirdPartyLib: return false
        }
    }
    
    
    var packages: [Package] {
        switch self {
        case .App: return []
        case .ThirdPartyLib: return []
        }
    }
    
    var resourceSynthesizers:[ResourceSynthesizer] {
        switch self {
        case .App: return .default
        case .ThirdPartyLib: return .default
        }
    }
}
