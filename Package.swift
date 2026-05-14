// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SocialSymbols",
    platforms: [
        .iOS("16.0"),
        .macOS("13.0"),
        .tvOS("16.0"),
        .watchOS("9.0"),
        .visionOS("1.0")
    ],
    products: [
        .library(
            name: "SocialSymbols",
            targets: ["SocialSymbols"]
        )
    ],
    targets: [
        .target(
            name: "SocialSymbols",
            resources: [
                .process("Resources/Assets.xcassets")
            ]
        ),
        .testTarget(
            name: "SocialSymbolsTests",
            dependencies: ["SocialSymbols"]
        )
    ]
)
