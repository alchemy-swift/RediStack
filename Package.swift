// swift-tools-version:5.1
//===----------------------------------------------------------------------===//
//
// This source file is part of the RediStack open source project
//
// Copyright (c) 2019-2020 RediStack project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of RediStack project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
    name: "RediStack",
    products: [
        .library(name: "RediStack", targets: ["RediStack"]),
        .library(name: "RediStackTestUtils", targets: ["RediStackTestUtils"]),
        .library(name: "RedisTypes", targets: ["RedisTypes"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-metrics.git", "1.0.0" ..< "3.0.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0"),
    ],
    targets: [
        .target(name: "RediStack", dependencies: ["NIO", "NIOSSL", "Logging", "Metrics"]),
        .target(name: "RedisTypes", dependencies: ["RediStack"]),
        .target(name: "RediStackTestUtils", dependencies: ["NIO", "RediStack"]),
        .testTarget(name: "RediStackTests", dependencies: ["RediStack", "NIO", "RediStackTestUtils", "NIOTestUtils"]),
        .testTarget(name: "RedisTypesTests", dependencies: ["RediStack", "NIO", "RediStackTestUtils", "RedisTypes"]),
        .testTarget(name: "RediStackIntegrationTests", dependencies: ["RediStack", "NIO", "RediStackTestUtils"])
    ]
)
