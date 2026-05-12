// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SocialSymbols",
    platforms: [
        .iOS("16.2"),
        .macOS("13.1")
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
