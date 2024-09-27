import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Lottie = TargetDependency.external(name: "Lottie")
    static let TCA = TargetDependency.external(name: "ComposableArchitecture")
    
}
