// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PDFToolbox",
    platforms: [
        // Relevant platforms.
        .iOS(.v13), .macOS(.v10_15), .tvOS(.v13)
    ],
    products: [
        .library(name: "PDFToolbox", targets: ["PDFToolbox"])
    ],
    dependencies: [
        // It's a good thing to keep things relatively
        // independent, but add any dependencies here.
    ],
    targets: [
        .target(
            name: "PDFToolbox",
            dependencies: [],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
        .testTarget(name: "PDFToolboxTests", dependencies: ["PDFToolbox"]),
    ]
)
