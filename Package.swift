// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Web",
    products: [
        .library(name: "Web", targets: ["Web"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-code/log.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/aio.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/http.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/crypto.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-code/test.git",
            .branch("master"))
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
