// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Engineering information for a given module.
	public struct ShipEngineering: PrismaticObject {
		public init(json: PrismaticJsonObject) {
			engineer = json["Engineer", default: "Engineer"]
			engineerId = json["EngineerID", default: 0]
			blueprintId = json["BlueprintID", default: 0]
			blueprintName = json["BlueprintName", default: "Blueprint"]
			level = json["Level", default: 1]
			quality = json["Quality", default: 1.0]
			modifiers = json["Modifiers", default: []]
		}

		public let engineer: String
		public let engineerId: UInt
		public let blueprintId: UInt
		public let blueprintName: String
		public let level: Int
		public let quality: Double
		public let modifiers: [Mutator]
	}
}
