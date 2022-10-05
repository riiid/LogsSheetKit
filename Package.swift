// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LogsSheetKit",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "LogsSheetKit",
      targets: ["LogsSheetKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/ivanvorobei/SPIndicator", .upToNextMajor(from: "1.6.0")),
  ],
  targets: [
    .target(
      name: "LogsSheetKit",
      dependencies: [
        "SPIndicator"
      ]),
    .testTarget(
      name: "LogsSheetKitTests",
      dependencies: ["LogsSheetKit"]),
  ]
)
