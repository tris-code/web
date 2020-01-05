// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Web",
    products: [
        .library(name: "Web", targets: ["Web"]),
    ],
    dependencies: [
        .package(path: "../Log"),
        .package(path: "../AIO"),
        .package(path: "../HTTP"),
        .package(path: "../Crypto"),
        .package(path: "../Test")
    ],
    targets: [
        .target(
            name: "Web",
            dependencies: ["MVC", "AIO", "Log"]),
        .target(
            name: "MVC",
            dependencies: ["HTTP", "SHA1", "UUID"]),
        .testTarget(
            name: "WebTests",
            dependencies: ["Web", "Test"]),
        .testTarget(
            name: "MVCTests",
            dependencies: ["MVC", "Test"]),
    ]
)
