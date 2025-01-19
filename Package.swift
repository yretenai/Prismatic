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
			path: "Vendor/TSCFileSystem",
			swiftSettings: [
				.swiftLanguageMode(.v5)
			]),
		.target(
			name: "PrismaticCodex",
			dependencies: [
				.target(name: "TSCFileSystem")
			]),
		.executableTarget(
			name: "Prismatic",
			dependencies: [
				.target(name: "PrismaticCodex")
			]),
		.testTarget(
			name: "PrismaticCodexTests",
			dependencies: [
				.target(name: "PrismaticCodex")
			]),
	]
)
