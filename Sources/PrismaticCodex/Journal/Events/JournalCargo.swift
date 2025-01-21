// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Represents a single item in cargo.
public struct JournalCargoItem {
	public init(json: [String: Any]) {
		name = LocalisedSymbolId(json: json, key: "Name")
		count = json["Count"] as? Int ?? 0
		stolen = json["Stolen"] as? Int ?? 0
		missionId = json["Stolen"] as? Int
	}

	/// The name of this item.
	public let name: LocalisedSymbolId

	/// How many are in cargo.
	public let count: Int

	/// How many are stolen items.
	public let stolen: Int

	/// Optional mission identifier, if relevant.
	public let missionId: Int?
}

/// Written at startup, note this is now written slightly later in startup, after we have initialised
/// missions, so we can detect if any cargo came from an abandoned delivery mission.
///
/// The first "Cargo" event in the file will contain the full inventory, others just indicate a separate file
/// has been written.
///
/// Note that the full data is now written to a separate Cargo.json file.
public class JournalCargo: JournalEntry {
	required init(json: [String: Any], event: JournalEvent) {
		vessel = VesselType(rawValue: (json["Vessel"] as? String)?.lowercased()) ?? .invalid
		inventory = (json["Inventory"] as? [[String: Any]])?.map({ JournalCargoItem(json: $0) }) ?? []

		super.init(json: json, event: event)
	}

	public override var description: String {
		"\(super.description), \(vessel) with \(inventory.count) items"
	}

	/// The vessel type for this cargo event.
	/// Note that invalid may also indicate Cargo.json has updated.
	public let vessel: VesselType

	/// The items in this vehicle.
	public let inventory: [JournalCargoItem]
}
