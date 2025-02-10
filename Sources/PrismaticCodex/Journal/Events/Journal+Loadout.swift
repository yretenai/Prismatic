// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Emitted at startup, when loading from main menu, or when switching ships,
	/// or after changing the ship in Outfitting, or when docking SRV back in mothership.
	public class Loadout: Journal {
		required init(json: PrismaticJsonObject, event: Event) {
			ship = json["Ship", default: "Ship"]
			shipId = json["ShipID", default: 0]
			shipName = json["ShipName", default: ship, nilOn: { test in test.isEmpty }]
			shipIdentifier = json["ShipIdent", default: "Ship"]
			hullValue = json["HullValue", default: 0]
			moduleValue = json["ModulesValue", default: 0]
			hullHealth = json["HullHealth", default: 0]
			unladenMass = json["UnladenMass", default: 0]
			fuelCapacity = json["FuelCapacity", default: { FuelInfo() }()]
			cargoCapacity = json["CargoCapacity", default: 0]
			maxJumpRange = json["MaxJumpRange", default: 0]
			rebuy = json["Rebuy", default: 0]
			hot = json["Hot", default: false]
			modules = json["Modules", default: []]

			super.init(json: json, event: event)
		}

		public override var description: String {
			"\(super.description), \(shipName) [\(shipIdentifier)] (\(shipId))"
		}

		public let ship: String
		public let shipId: UInt
		public let shipName: String
		public let shipIdentifier: String
		public let hullValue: UInt
		public let moduleValue: UInt
		public let hullHealth: Double
		public let unladenMass: Double
		public let fuelCapacity: FuelInfo
		public let cargoCapacity: UInt
		public let maxJumpRange: Double
		public let rebuy: UInt
		public let hot: Bool
		public let modules: [ShipModule]
	}
}
