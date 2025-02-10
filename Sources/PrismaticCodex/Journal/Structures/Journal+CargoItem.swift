// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Represents a single item in cargo.
	public struct CargoItem: MissionRelatedEvent, PrismaticObject {
		public init(json: PrismaticJsonObject) {
			name = EliteSymbol(json: json, key: "Name")
			count = json["Count", default: 0]
			stolen = json["Stolen", default: 0]
			missionId = json["Stolen"]
		}

		/// The name of this item.
		public let name: EliteSymbol

		/// How many are in cargo.
		public let count: Int

		/// How many are stolen items.
		public let stolen: Int

		/// Optional mission identifier, if relevant.
		public let missionId: UInt?
	}
}
