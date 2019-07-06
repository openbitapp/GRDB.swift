// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRDB",
    products: [
        .library(name: "GRDB", targets: ["GRDB"]),
    ],
    platforms: [
        .iOS(.v10),
        .watchOS(.v3),
        .tvOS(.v12),
        .macOS(.v10_12)
    ],
    dependencies: [
        .package(url: "https://github.com/groue/CSQLite.git", from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "GRDB",
            path: "GRDB",
            swiftSettings: [
                .define("SQLITE_ENABLE_FTS5")
            ]
        ),
        .testTarget(
            name: "GRDBTests",
            dependencies: ["GRDB"],
            path: "Tests",
            exclude: [
                "CocoaPods",
                "Crash",
                "Performance",
                "SPM"
            ])
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
