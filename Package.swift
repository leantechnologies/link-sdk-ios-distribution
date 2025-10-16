// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let buildNumber = "30"
let checksum = "166d9d86a7da82f35c1cc3ead5c8203013f405d9d7cb4d6e98cd8bbd9f4ebce6"

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
        .binaryTarget(
            name: "LeanSDK",
            url: "https://cdn.leantech.me/link/sdk/ios/build.\(buildNumber)/LeanSDK.xcframework-build.\(buildNumber).zip",
            checksum: checksum
        )
    ]
)
