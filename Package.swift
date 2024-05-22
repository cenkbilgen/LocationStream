// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocationStream",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "LocationStream",
            targets: ["LocationStream"]),
    ],
    targets: [
        .target(
            name: "LocationStream"),
        .testTarget(
            name: "LocationStreamTests",
            dependencies: ["LocationStream"]),
    ]
)
