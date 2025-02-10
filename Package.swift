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
	dependencies: [
		.package(url: "https://github.com/yretenai/FileMonitor.git", branch: "main"),
		.package(url: "https://github.com/rensbreur/SwiftTUI.git", revision: "537133031bc2b2731048d00748c69700e1b48185"),
	],
	targets: [
		.target(
			name: "PrismaticCodex",
			dependencies: [
				.product(name: "FileMonitor", package: "FileMonitor")
			]),
		.executableTarget(
			name: "Prismatic",
			dependencies: [
				.target(name: "PrismaticCodex"),
				.product(name: "SwiftTUI", package: "SwiftTUI"),
			]),
		.testTarget(
			name: "PrismaticCodexTests",
			dependencies: [
				.target(name: "PrismaticCodex")
			]),
	]
)
