// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2
// swift-tools-version: 6.0

import PackageDescription

var products: [Product] = [
	.library(
		name: "PrismaticCodex",
		targets: ["PrismaticCodex"])
]

var targets: [Target] = [
	.target(
		name: "PrismaticCodex",
		dependencies: [
			.product(name: "FileMonitor", package: "FileMonitor")
		]),
	.testTarget(
		name: "PrismaticCodexTests",
		dependencies: [
			.target(name: "PrismaticCodex")
		]),
]

var dependencies: [Package.Dependency] = [
	.package(url: "https://github.com/yretenai/FileMonitor.git", branch: "main")
]

#if !os(Windows)
	products += [
		.executable(
			name: "Prismatic",
			targets: ["Prismatic"]
		)
	]

	targets += [
		.executableTarget(
			name: "Prismatic",
			dependencies: [
				.target(name: "PrismaticCodex"),
				.product(name: "SwiftTUI", package: "SwiftTUI"),
			])
	]

	dependencies += [
		.package(url: "https://github.com/yretenai/SwiftTUI.git", branch: "main")
	]
#endif

let package = Package(
	name: "PrismaticCodex",
	platforms: [.macOS(.v14)],
	products: products,
	dependencies: dependencies,
	targets: targets
)
