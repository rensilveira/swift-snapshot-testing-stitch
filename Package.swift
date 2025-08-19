// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnapshotTestingStitch",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "SnapshotTestingStitch",
            targets: ["SnapshotTestingStitch"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/rensilveira/swift-snapshot-testing", branch: "main"),
        .package(url: "https://github.com/rensilveira/SnapshotTestingHEIC", branch: "master"),
    ],
    targets: [
        .target(
            name: "SnapshotTestingStitch",
            dependencies: [
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "SnapshotTestingHEIC", package: "SnapshotTestingHEIC"),
            ]
        ),
        
        .testTarget(
            name: "SnapshotTestingStitchTests",
            dependencies: ["SnapshotTestingStitch"],
            exclude: ["__Snapshots__"]
        ),
    ]
)
