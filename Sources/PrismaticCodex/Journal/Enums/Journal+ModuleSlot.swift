// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	public enum ModuleSlot {
		case invalid
		case hardpoint(size: HardpointSize, index: Int)

		// core
		case armour
		case cargoHatch
		case frameShiftDrive
		case fuelTank
		case lifeSupport
		case mainEngines
		case powerDistributor
		case powerplant
		case sensors
		case shipCockpit

		// optional
		case militaryOptional(index: Int)
		case optional(index: Int, size: Int)
		case planetaryApproachSuite

		// livery
		case bobble(index: Int)
		case decal(index: Int)
		case engineColour
		case paintjob
		case shipId(index: Int)
		case shipKit(component: ShipKitComponent)
		case shipName(index: Int)
		case vesselVoice
		case weaponColour

		case unknown(value: String)
	}
}

extension Journal.ModuleSlot {
	init(slotName: String?) {
		guard let slotName = slotName?.lowercased() else {
			self = .invalid
			return
		}

		if slotName.starts(with: "military") {
			self = .militaryOptional(index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 8)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "slot") {
			let slot = Int(slotName[slotName.index(slotName.startIndex, offsetBy: 4)...slotName.index(slotName.startIndex, offsetBy: 7)], radix: 10) ?? 0
			let size = Int(slotName[slotName.index(slotName.startIndex, offsetBy: 11)...], radix: 10) ?? 0
			self = .optional(index: slot, size: size)
		}

		if slotName.starts(with: "tinyhardpoint") {
			self = .hardpoint(size: .tiny, index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 13)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "smallhardpoint") {
			self = .hardpoint(size: .small, index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 14)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "mediumhardpoint") {
			self = .hardpoint(size: .medium, index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 15)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "largehardpoint") {
			self = .hardpoint(size: .large, index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 14)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "hugehardpoint") {
			self = .hardpoint(size: .huge, index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 13)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "bobble") {
			self = .bobble(index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 6)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "decal") {
			self = .bobble(index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 5)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "shipname") {
			self = .shipName(index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 8)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "shipid") {
			self = .shipId(index: Int(slotName[slotName.index(slotName.startIndex, offsetBy: 6)...], radix: 10) ?? 0)
			return
		}

		if slotName.starts(with: "shipkit") {
			guard let component = Journal.ShipKitComponent(rawValue: String(slotName[slotName.index(slotName.startIndex, offsetBy: 7)...])) else {
				self = .unknown(value: slotName)
				return
			}

			self = .shipKit(component: component)
			return
		}

		switch slotName {
			case "armour":
				self = .armour
				return
			case "cargohatch":
				self = .cargoHatch
				return
			case "frameshiftdrive":
				self = .frameShiftDrive
				return
			case "fueltank":
				self = .fuelTank
				return
			case "lifesupport":
				self = .lifeSupport
				return
			case "mainengines":
				self = .mainEngines
				return
			case "powerdistributor":
				self = .powerDistributor
				return
			case "radar":
				self = .sensors
				return
			case "shipcockpit":
				self = .shipCockpit
				return
			case "planetaryapproachsuite":
				self = .planetaryApproachSuite
				return
			case "enginecolour":
				self = .engineColour
				return
			case "painjob":
				self = .paintjob
				return
			case "vesselvoice":
				self = .vesselVoice
				return
			case "weaponColour":
				self = .weaponColour
				return
			default:
				self = .unknown(value: slotName)
				return
		}

	}
}
