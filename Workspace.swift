import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: ENV.workspaceName,
    projects: [
        "PRJ/\(ModuleNames.App.name)"
    ]
)

