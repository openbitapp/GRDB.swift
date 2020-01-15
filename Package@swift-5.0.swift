// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRDB",
    platforms: [
        .iOS(.v10),
        .watchOS(.v3),
        .tvOS(.v12),
        .macOS(.v10_12)
    ],
    products: [
        .library(name: "GRDB", targets: ["GRDB"]),
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(
            name: "sqlite3",
            providers: [.apt(["libsqlite3-dev"])]
        ),
        .target(
            name: "GRDB",
            dependencies: ["sqlite3"],
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
                "CustomSQLite",
                "Crash",
                "Performance",
                "SPM"
            ])
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
