// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlidableImageView",
    
    platforms: [
        .macOS(.v11),  // Specify macOS version 10.15 or later
        .iOS(.v13)        // Specify iOS version 13 or later
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SlidableImageView",
            targets: ["SlidableImageView"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SlidableImageView"),
        .testTarget(
            name: "SlidableImageViewTests",
            dependencies: ["SlidableImageView"]),
    ]
)
