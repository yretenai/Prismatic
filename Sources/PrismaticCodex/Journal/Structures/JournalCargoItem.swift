// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Represents a single item in cargo.
public struct JournalCargoItem: MissionRelatedEvent, PrismaticObject {
	public init(json: PrismaticJsonObject) {
		name = LocalisedSymbolId(json: json, key: "Name")
		count = json["Count", default: 0]
		stolen = json["Stolen", default: 0]
		missionId = json["Stolen"]
	}

	/// The name of this item.
	public let name: LocalisedSymbolId

	/// How many are in cargo.
	public let count: Int

	/// How many are stolen items.
	public let stolen: Int

	/// Optional mission identifier, if relevant.
	public let missionId: UInt?
}
