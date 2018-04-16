// swift-tools-version:4.2
/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import PackageDescription

let package = Package(
    name: "Web",
    products: [
        .library(name: "Web", targets: ["Web"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/log.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/aio.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/http.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/crypto.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/test.git",
            .branch("master"))
    ],
    targets: [
        .target(
            name: "Web",
            dependencies: ["MVC", "AIO", "Log"]),
        .target(
            name: "MVC",
            dependencies: ["HTTP", "Crypto"]),
        .testTarget(
            name: "WebTests",
            dependencies: ["Web", "Test"]),
        .testTarget(
            name: "MVCTests",
            dependencies: ["MVC", "Test"]),
    ]
)
