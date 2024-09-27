import ProjectDescription

public protocol ModuleProtocol {
    var name: String { get }
    var includeTesting:Bool { get }
    var destinations:Destinations { get }
    var product:Product { get }
    var bundleId:String { get }
    var infoPlist:InfoPlist { get }
    var sources:SourceFilesList? { get }
    var resources:ResourceFileElements? { get }
    var dependencies:[TargetDependency] { get }
    var resourceSynthesizers: [ResourceSynthesizer] { get }
}
