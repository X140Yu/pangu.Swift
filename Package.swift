// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pangu-Swift",
    products: [
        .library(
            name: "Pangu-Swift",
            targets: ["Pangu-Swift"]),
    ],
    targets: [
        .target(
            name: "Pangu-Swift",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "Pangu-SwiftTests",
            dependencies: ["Pangu-Swift"],
            path: "Tests")
    ],
    swiftLanguageVersions: [4]
)
