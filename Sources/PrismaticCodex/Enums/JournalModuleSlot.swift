// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

public enum JournalModuleAttribute: String {
	case unknown
	case afmRepairCapacity = "afmrepaircapacity"
	case afmRepairConsumption = "afmrepairconsumption"
	case afmRepairPerAmmo = "afmrepairperammo"
	case ammoClipSize = "ammoclipsize"
	case ammoMaximum = "ammomaximum"
	case armourPenetration = "armourpenetration"
	case boostAugmenterPowerUse = "boostaugmenterpoweruse"
	case boostSpeedMultiplier = "boostspeedmultiplier"
	case bootTime = "boottime"
	case breachDamage = "breachdamage"
	case brokenRegenRate = "brokenregenrate"
	case burstRateOfFire = "burstrateoffire"
	case burstSize = "burstsize"
	case cabinCapacity = "cabincapacity"
	case cabinClass = "cabinclass"
	case cargoCapacity = "cargocapacity"
	case causticResistance = "causticresistance"
	case chaffJamDuration = "chaffjamduration"
	case `class` = "class"
	case damage = "damage"
	case damageFalloffRange = "damagefalloffrange"
	case damagePerSecond = "damagepersecond"
	case damageType = "damagetype"
	case defenceModifierHealthAddition = "defencemodifierhealthaddition"
	case defenceModifierHealthMultiplier = "defencemodifierhealthmultiplier"
	case defenceModifierShieldAddition = "defencemodifiershieldaddition"
	case defenceModifierShieldMultiplier = "defencemodifiershieldmultiplier"
	case discoveryScannerPassiveRange = "discoveryscannerpassiverange"
	case discoveryScannerRange = "discoveryscannerrange"
	case disruptionBarrierActivePower = "disruptionbarrieractivepower"
	case disruptionBarrierChargeDuration = "disruptionbarrierchargeduration"
	case disruptionBarrierCooldown = "disruptionbarriercooldown"
	case disruptionBarrierRange = "disruptionbarrierrange"
	case distributorDraw = "distributordraw"
	case droneFuelCapacity = "dronefuelcapacity"
	case droneHackingTime = "dronehackingtime"
	case droneLifeTime = "dronelifetime"
	case droneMaxJettisonedCargo = "dronemaxjettisonedcargo"
	case droneMinJettisonedCargo = "droneminjettisonedcargo"
	case droneMultiTargetSpeed = "dronemultitargetspeed"
	case droneRepairCapacity = "dronerepaircapacity"
	case droneSpeed = "dronespeed"
	case droneTargetRange = "dronetargetrange"
	case dssAngleMult = "dss_anglemult"
	case dssPatchRadius = "dss_patchradius"
	case dssRangeMult = "dss_rangemult"
	case dssRateMult = "dss_ratemult"
	case ecmActivePowerConsumption = "ecmactivepowerconsumption"
	case ecmCooldown = "ecmcooldown"
	case ecmHeat = "ecmheat"
	case ecmRange = "ecmrange"
	case ecmTimeToCharge = "ecmtimetocharge"
	case energyPerRegen = "energyperregen"
	case engineHeatRate = "engineheatrate"
	case engineMaxPerformance = "enginemaxperformance"
	case engineMinimumMass = "engineminimummass"
	case engineMinPerformance = "engineminperformance"
	case engineOptimalMass = "engineoptimalmass"
	case engineOptPerformance = "engineoptperformance"
	case enginesCapacity = "enginescapacity"
	case enginesRecharge = "enginesrecharge"
	case explosiveResistance = "explosiveresistance"
	case falloffRange = "falloffrange"
	case fighterBoostSpeed = "fighterboostspeed"
	case fighterDPS = "fighterdps"
	case fighterMaxSpeed = "fightermaxspeed"
	case fighterPitchRate = "fighterpitchrate"
	case fighterRollRate = "fighterrollrate"
	case fighterYawRate = "fighteryawrate"
	case fsdFuelUseIncrease = "fsdfueluseincrease"
	case fSDHeatRate = "fsdheatrate"
	case fsdInterdictorFacingLimit = "fsdinterdictorfacinglimit"
	case fsdInterdictorRange = "fsdinterdictorrange"
	case fsdJumpRangeBoost = "fsdjumprangeboost"
	case fSDOptimalMass = "fsdoptimalmass"
	case fuelCapacity = "fuelcapacity"
	case fuelScoopRate = "fuelscooprate"
	case heatEfficiency = "heatefficiency"
	case heatSinkDuration = "heatsinkduration"
	case integrity = "integrity"
	case jitter = "jitter"
	case kineticResistance = "kineticresistance"
	case mass = "mass"
	case maxActiveDrones = "maxactivedrones"
	case maxAngle = "maxangle"
	case maxBreachChance = "maxbreachchance"
	case maxFuelPerJump = "maxfuelperjump"
	case maximumMass = "maximummass"
	case maximumRange = "maximumrange"
	case maxRange = "maxrange"
	case minBreachChance = "minbreachchance"
	case moduleDefenceAbsorption = "moduledefenceabsorption"
	case numBuggySlots = "numbuggyslots"
	case oxygenTimeCapacity = "oxygentimecapacity"
	case powerCapacity = "powercapacity"
	case powerDraw = "powerdraw"
	case range = "range"
	case rateOfFire = "rateoffire"
	case refineryBins = "refinerybins"
	case regenRate = "regenrate"
	case reloadTime = "reloadtime"
	case roundsPerShot = "roundspershot"
	case scannerRange = "scannerrange"
	case scannerTimeToScan = "scannertimetoscan"
	case sensorTargetScanAngle = "sensortargetscanangle"
	case shieldBankDuration = "shieldbankduration"
	case shieldBankHeat = "shieldbankheat"
	case shieldBankReinforcement = "shieldbankreinforcement"
	case shieldBankSpinUp = "shieldbankspinup"
	case shieldGenMaximumMass = "shieldgenmaximummass"
	case shieldGenMaxStrength = "shieldgenmaxstrength"
	case shieldGenMinimumMass = "shieldgenminimummass"
	case shieldGenMinStrength = "shieldgenminstrength"
	case shieldGenOptimalMass = "shieldgenoptimalmass"
	case shieldGenStrength = "shieldgenstrength"
	case shieldSacrificeAmountGiven = "shieldsacrificeamountgiven"
	case shieldSacrificeAmountRemoved = "shieldsacrificeamountremoved"
	case shotSpeed = "shotspeed"
	case size = "size"
	case systemsCapacity = "systemscapacity"
	case systemsRecharge = "systemsrecharge"
	case thermalDrain = "thermaldrain"
	case thermalLoad = "thermalload"
	case thermicResistance = "thermicresistance"
	case vehicleArmourHealth = "vehiclearmourhealth"
	case vehicleCargoCapacity = "vehiclecargocapacity"
	case vehicleFuelCapacity = "vehiclefuelcapacity"
	case vehicleHullMass = "vehiclehullmass"
	case vehicleShieldHealth = "vehicleshieldhealth"
	case weaponMode = "weaponmode"
	case weaponsCapacity = "weaponscapacity"
	case weaponsRecharge = "weaponsrecharge"
	case wingDamageReduction = "wingdamagereduction"
	case wingMaxDuration = "wingmaxduration"
	case wingMinDuration = "wingminduration"

}

public enum JournalHardpointSize: String {
	case huge
	case large
	case medium
	case small
	case tiny
}

public enum JournalShipKitComponent: String {
	case spoiler
	case wings
	case tail
	case bumper
}

public enum JournalModuleSlot {
	case invalid
	case hardpoint(size: JournalHardpointSize, index: Int)

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
	case shipKit(component: JournalShipKitComponent)
	case shipName(index: Int)
	case vesselVoice
	case weaponColour

	case unknown(value: String)
}

extension JournalModuleSlot {
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
			guard let component = JournalShipKitComponent(rawValue: String(slotName[slotName.index(slotName.startIndex, offsetBy: 7)...])) else {
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
