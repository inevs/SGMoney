// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "SGMoney",
    products: [
        .library(
            name: "SGMoney",
            targets: ["SGMoney"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SGMoney",
            dependencies: []),
        .testTarget(
            name: "SGMoneyTests",
            dependencies: ["SGMoney"]),
    ]
)
