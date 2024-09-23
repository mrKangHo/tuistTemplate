import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

 

public extension TargetDependency.SPM {
    static let TCA = TargetDependency.external(name: "ComposableArchitecture")
    
}
