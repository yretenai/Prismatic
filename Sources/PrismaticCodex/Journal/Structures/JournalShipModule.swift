// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Represents a ship module.
public struct JournalShipModule: PrismaticObject {
	public init(json: PrismaticJsonObject) {
		slot = JournalModuleSlot(slotName: json["Slot"])
		name = json["Item", default: "Item"]
		isOn = json["On", default: true]
		powerPriority = json["Priority", default: 1]
		health = json["Health", default: 1.0]
		value = json["Value", default: 0]
		ammoInClip = json["AmmoInClip"]
		ammoInReserve = json["AmmoInHopper"]
		engineering = json["Engineering"]
	}

	public let slot: JournalModuleSlot
	public let name: String
	public let isOn: Bool
	public let powerPriority: Int
	public let health: Double
	public let value: UInt
	public let ammoInClip: Int?
	public let ammoInReserve: Int?
	public let engineering: JournalShipEngineering?
}

/// Engineering information for a given module.
public struct JournalShipEngineering: PrismaticObject {
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
	public let modifiers: [JournalMutator]
}

/// An attributor mutator for an engineered module.
public struct JournalMutator: PrismaticObject {
	public init(json: PrismaticJsonObject) {
		attribute = JournalModuleAttribute(rawValue: json["Label"]) ?? .unknown
		value = json["Value", default: 0.0]
		originalValue = json["OriginalValue", default: 0.0]
		lessIsGood = json["LessIsGood", default: 0] == 1
	}

	public let attribute: JournalModuleAttribute
	public let value: Double
	public let originalValue: Double
	public let lessIsGood: Bool
}
