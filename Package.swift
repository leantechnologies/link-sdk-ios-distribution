// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let buildNumber = "26"
let checksum = "3ac5fad346a962e59d6475e08cccca6513933d012d392edb0876697c054d9f3d"

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
