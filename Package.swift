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
        .binaryTarget(name: "LeanSDK", url: "https://alex-tomlinson-public.s3.eu-west-1.amazonaws.com/LeanSDK.xcframework-1.0.11.zip", checksum: "81ec407aaf3ae29cadef2c3799a3aee3891b603b8a187aa3b8e3d0f490c6129c")
    ]
)
