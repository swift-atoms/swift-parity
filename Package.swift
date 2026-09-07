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
        .library(name: "Parity", targets: ["Parity"]),

        .library(name: "Parity Foundation Integration", targets: ["Parity Foundation Integration"]),
        .library(name: "Parity Test Support", targets: ["Parity Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-pair.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Parity",
            dependencies: [
                .product(name: "Pair", package: "swift-pair"),
            ],
            path: "Sources/Parity"
        ),
        
        .target(
            name: "Parity Foundation Integration",
            dependencies: [
                .target(name: "Parity"),
            ],
            path: "Sources/Parity Foundation Integration"
        ),
        .target(
            name: "Parity Test Support",
            dependencies: [
                .target(name: "Parity"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Parity Tests",
            dependencies: [
                .target(name: "Parity"),
                .target(name: "Parity Test Support"),
                .target(name: "Parity Foundation Integration"),
            ],
            path: "Tests/Parity Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
