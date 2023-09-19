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
        .binaryTarget(name: "LeanSDK", url: "https://cdn.leantech.me/link/sdk/ios/3.0.1/LeanSDK.xcframework-3.0.1.zip", checksum: "506d889dfc18b64531ac0e30c9334660002f750cb295635ac7f27bfe4c46baed")
    ]
)
