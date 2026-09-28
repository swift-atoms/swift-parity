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
    traits: [
        .trait(name: "Finite", description: "Finite integration"),
        .trait(name: "Algebra", description: "Parity Algebra integration"),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-optic.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-algebra.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-pair.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-atoms/swift-finite.git", branch: "main", traits: [.trait(name: "Algebra", condition: .when(traits: ["Finite"]))]),
        .package(url: "https://github.com/swift-atoms/swift-cardinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-ordinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-index.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),
    ],
    targets: [
        .testTarget(
            name: "Parity Algebra Integration Tests",
            dependencies: [
                .target(name: "Parity"),
                .target(name: "Parity Test Support"),
                .product(name: "Algebra", package: "swift-algebra", condition: .when(traits: ["Algebra"])),
                .product(name: "Optic", package: "swift-optic", condition: .when(traits: ["Algebra"])),
            ],
            path: "Tests/Parity Algebra Integration Tests"
        ),
        .target(
            name: "Parity",
            dependencies: [
                .product(name: "Algebra", package: "swift-algebra", condition: .when(traits: ["Algebra"])),
                .product(name: "Optic", package: "swift-optic", condition: .when(traits: ["Algebra"])),
                .product(name: "Pair", package: "swift-pair"),
                .product(name: "Finite", package: "swift-finite", condition: .when(traits: ["Finite"])),
                .product(name: "Cardinal", package: "swift-cardinal", condition: .when(traits: ["Finite"])),
                .product(name: "Ordinal", package: "swift-ordinal", condition: .when(traits: ["Finite"])),
                .product(name: "Index", package: "swift-index", condition: .when(traits: ["Finite"])),
                .product(name: "Tagged", package: "swift-tagged", condition: .when(traits: ["Finite"])),
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
        .testTarget(name: "Parity Finite Algebra Migration Tests", dependencies: [
            .target(name: "Parity"),
            .product(name: "Finite", package: "swift-finite", condition: .when(traits: ["Finite"])),
            .product(name: "Algebra", package: "swift-algebra", condition: .when(traits: ["Finite"])),
            .product(name: "Cardinal", package: "swift-cardinal", condition: .when(traits: ["Finite"])),
            .product(name: "Ordinal", package: "swift-ordinal", condition: .when(traits: ["Finite"])),
        ], path: "Tests/Parity Finite Algebra Migration Tests"),
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
