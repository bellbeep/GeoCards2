// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GeoCards",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "GeoCards", targets: ["GeoCards"]),
    ],
    targets: [
        .target(name: "GeoCards", dependencies: [])
    ]
)
