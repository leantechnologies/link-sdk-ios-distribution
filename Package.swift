// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let buildNumber = "23"
let checksum = "262a201c6132605274f89e9945a46c64e8d5660da3384891b26ebd76f0accc7a"

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
