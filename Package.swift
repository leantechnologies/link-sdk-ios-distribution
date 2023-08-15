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
        .binaryTarget(name: "LeanSDK", url: "https://cdn.leantech.me/link/sdk/ios/1.5.3/LeanSDK.xcframework-1.5.3.zip", checksum: "ba284f33558c2cb2cf0a474557452e43d9b891ad5c3a3d8b06f0519ebd341bab")
    ]
)
