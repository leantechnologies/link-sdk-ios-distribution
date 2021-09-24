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
        .binaryTarget(name: "LeanSDK", url: "https://cdn.leantech.me/link/sdk/ios/1.0.6/LeanSDK.xcframework-1.0.6.zip", checksum: "5cefce1139390aa9050637e4cf1d2cbf4b37e370f9e8f634189711f654e58778")
    ]
)
