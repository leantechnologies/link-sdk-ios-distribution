// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let buildNumber = "34"
let checksum = "cdaa3aa6e5b4072a593e700e3ceba4b1cab76f79e098772e2283df1bde47fce7"

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
