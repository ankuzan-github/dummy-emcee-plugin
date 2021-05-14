// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "EmceeReportPlugin",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(
            name: "Plugin",
            targets: ["EmceeReportExecutable"]
        ),
        .library(
            name: "EmceeReportLibrary",
            targets: ["EmceeReportLibrary"]),
    ],
    dependencies: [
        .package(name: "EmceeTestRunner", url: "https://github.com/avito-tech/Emcee", .revision("1cdf02a533bc13fa35a0e8b74f6d78f5e2f368bb"))
    ],
    targets: [
        .target(
            name: "EmceeReportExecutable",
            dependencies: [
                .product(name: "EmceePlugin", package: "EmceeTestRunner"),
                "EmceeReportLibrary"
            ],
            path: "Sources/EmceeReportExecutable"
        ),
        .target(
            name: "EmceeReportLibrary",
            dependencies: [
                .product(name: "EmceePlugin", package: "EmceeTestRunner"),
                .product(name: "EmceeInterfaces", package: "EmceeTestRunner")
            ],
            path: "Sources/EmceeReportLibrary"
        ),
        .testTarget(
            name: "VideoRecorderTests",
            dependencies: ["EmceeReportLibrary"]),
    ]
)
