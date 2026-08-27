// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-parity",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Parity",
            targets: ["Parity"]
        ),
        .library(
            name: "Parity Standard Library Integration",
            targets: ["Parity Standard Library Integration"]
        ),
        .library(
            name: "Parity Apple Foundation Integration",
            targets: ["Parity Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Parity",
            dependencies: []
        ),
        .target(
            name: "Parity Standard Library Integration",
            dependencies: ["Parity"]
        ),
        .target(
            name: "Parity Apple Foundation Integration",
            dependencies: [
                "Parity",
                "Parity Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Parity Tests",
            dependencies: ["Parity"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
