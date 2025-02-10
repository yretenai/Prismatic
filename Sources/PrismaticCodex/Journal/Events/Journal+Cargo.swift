// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Written at startup, note this is now written slightly later in startup, after we have initialised
	/// missions, so we can detect if any cargo came from an abandoned delivery mission.
	///
	/// The first "Cargo" event in the file will contain the full inventory, others just indicate a separate file
	/// has been written.
	///
	/// Note that the full data is now written to a separate Cargo.json file.
	public class Cargo: Journal {
		required init(json: PrismaticJsonObject, event: Event) {
			vessel = JournalVesselType(rawValue: json["Vessel", default: "invalid"].lowercased()) ?? .invalid
			inventory = json["Inventory", default: []]

			super.init(json: json, event: event)
		}

		public override var description: String {
			"\(super.description), \(vessel) with \(inventory.count) items"
		}

		/// The vessel type for this cargo event.
		/// Note that invalid may also indicate Cargo.json has updated.
		public let vessel: JournalVesselType

		/// The items in this vehicle.
		public let inventory: [CargoItem]
	}
}
