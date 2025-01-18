// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2
// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "PrismaticCodex",
	platforms: [.macOS(.v14)],
	products: [
		.library(
			name: "PrismaticCodex",
			targets: ["PrismaticCodex"]),
		.executable(
			name: "Prismatic",
			targets: ["Prismatic"]
		),
	],
	targets: [
		.target(
			name: "TSCFileSystem",
			swiftSettings: [
				.swiftLanguageMode(.v5)
			]),
		.target(
			name: "PrismaticCodex",
			dependencies: ["TSCFileSystem"]),
		.executableTarget(
			name: "Prismatic",
			dependencies: ["PrismaticCodex"]),
		.testTarget(
			name: "PrismaticCodexTests",
			dependencies: ["PrismaticCodex"]
		),
	]
)
