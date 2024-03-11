// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeanSDK",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LeanSDK",
            targets: ["LeanSDK"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(name: "LeanSDK", url: "https://cdn.leantech.me/link/sdk/ios/build.11/LeanSDK.xcframework-build.11.zip", checksum: "860c42daddfbd791fbad6e2b433edc0af750ec1a4bd125f8d2d2a3bcebddb071")
    ]
)
