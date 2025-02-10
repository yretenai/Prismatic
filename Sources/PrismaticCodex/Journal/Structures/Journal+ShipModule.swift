// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Represents a ship module.
	public struct ShipModule: PrismaticObject {
		public init(json: PrismaticJsonObject) {
			slot = ModuleSlot(slotName: json["Slot"])
			name = json["Item", default: "Item"]
			isOn = json["On", default: true]
			powerPriority = json["Priority", default: 1]
			health = json["Health", default: 1.0]
			value = json["Value", default: 0]
			ammoInClip = json["AmmoInClip"]
			ammoInReserve = json["AmmoInHopper"]
			engineering = json["Engineering"]
		}

		public let slot: ModuleSlot
		public let name: String
		public let isOn: Bool
		public let powerPriority: Int
		public let health: Double
		public let value: UInt
		public let ammoInClip: Int?
		public let ammoInReserve: Int?
		public let engineering: ShipEngineering?
	}
}
