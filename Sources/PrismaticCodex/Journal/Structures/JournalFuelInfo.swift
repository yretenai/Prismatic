// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Fuel Information seen in loadouts.
public struct JournalFuelInfo: PrismaticObject {
	public init(json: PrismaticJsonObject) {
		main = json["Main", default: 0.0]
		reserve = json["Reserve", default: 0.0]
	}

	public init() {
		main = 0.0
		reserve = 0.0
	}

	public let main: Double
	public let reserve: Double
}
