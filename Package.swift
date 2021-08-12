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
        .binaryTarget(name: "LeanSDK", url: "https://cdn.leantech.me/link/sdk/ios/1.0.4/LeanSDK.xcframework-1.0.4.zip", checksum: "8de528354ce412f8e573c670dcc4b7d43684707a0d2f13a9e883833aca7afd6c")
    ]
)
