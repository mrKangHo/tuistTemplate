import ProjectDescription

public protocol TargetProcol {
    var target:TargetDependency { get }
}


extension Module: TargetProcol {
    public var target: TargetDependency {
        return .project(target: self.name, path: .relativeToRoot("PRJ/\(self.name)"))
    }
}

extension Module.Feature: TargetProcol {
    public var target: TargetDependency {
        return .project(target: self.name, path: .relativeToRoot("PRJ/Features/\(self.name)"))
    }
}
