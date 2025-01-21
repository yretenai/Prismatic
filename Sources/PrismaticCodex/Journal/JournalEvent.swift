// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Complete list of journal events as of v37 (with some 2024 additions).
///
/// note: this enum is slow.
/// ref: https://hosting.zaonce.net/community/journal/v37/Journal_Manual_v37.pdf
/// ref: https://elite-journal.readthedocs.io/en/latest/
/// ref: https://forums.frontier.co.uk/threads/journal-docs-for-odyssey-release.575010
public enum JournalEvent: String, RawRepresentable, CaseInsensitiveEnum, Sendable {
	case invalidEvent
	case allBodiesFound = "FSSAllBodiesFound"
	case appliedToSquadron
	case approachBody
	case approachSettlement
	case asteroidCracked
	case autoDiscoveryScan = "DiscoveryScan"
	case backpack
	case backpackChange
	case backpackMaterials
	case bodySignals = "FSSBodySignals"
	case bookDropship
	case bookTaxi
	case bounty
	case buggyDestroyed = "SRVDestroyed"
	case buyAmmo
	case buyDrones
	case buyExplorationData
	case buyMicroResources
	case buySuit
	case buyTradeData
	case buyWeapon
	case cancelDropship
	case cancelTaxi
	case capitalShipBond = "CapShipBond"
	case cargo
	case cargoDepot
	case cargoTransfer
	case carrierBankTransfer
	case carrierBuy
	case carrierCancelDecommission
	case carrierCrewServices
	case carrierDecommission
	case carrierDepositFuel
	case carrierDockingPermission
	case carrierFinance
	case carrierJump
	case carrierJumpCancelled
	case carrierJumpRequest
	case carrierModulePack
	case carrierNameChange
	case carrierShipPack
	case carrierStats
	case carrierTradeOrder
	case changeCrewRole
	case clearImpound
	case clearSavedGame
	case cockpitBreached
	case codexEntry
	case collectCargo
	case collectItems
	case commander
	case commitCrime
	case communityGoal
	case communityGoalDiscard
	case communityGoalJoin
	case communityGoalReward
	case continued
	case createSuitLoadout
	case crewAssign
	case crewFire
	case crewHire
	case crewLaunchFighter
	case crewMemberJoins
	case crewMemberQuits
	case crewMemberRoleChange
	case crimeVictim
	case datalinkScan
	case datalinkVoucher
	case dataScanned
	case deleteSuitLoadout
	case deliverPowerMicroResources
	case died
	case disbandedSquadron
	case discoveryScan = "FSSDiscoveryScan"
	case disembark
	case dockBuggy = "DockSRV"
	case docked
	case dockFighter
	case dockingCancelled
	case dockingDenied
	case dockingGranted
	case dockingRequested
	case dockingTimeout
	case dropItems
	case dropshipDeploy
	case ejectCargo
	case embark
	case endCrewSession
	case engineerApply
	case engineerContribution
	case engineerCraft
	case engineerLegacyConvert
	case engineerProgress
	case escapeInterdiction
	case factionKillBond
	case fetchRemoteModule
	case fieldMaintenanceRepairs = "AFMURepairs"
	case fighterDestroyed
	case fighterRebuilt
	case fileHeader
	case fleetCarrierMaterials = "FCMaterials"
	case friends
	case fuelScoop
	case heatDamage
	case heatWarning
	case holoscreenHacked
	case hullDamage
	case interdicted
	case interdiction
	case invitedToSquadron
	case jetConeBoost
	case jetConeDamage
	case joinCrew = "joinACrew"
	case joinedSquadron
	case jumpSystem = "FSDJump"
	case kickCrewMember
	case kickedFromSquadron
	case launchBuggy = "LaunchSRV"
	case launchDrone
	case launchFighter
	case leaveBody
	case leftSquadron
	case liftoff
	case loadGame
	case loadout
	case loadoutEquipModule
	case loadoutRemoveModule
	case location
	case market
	case marketBuy
	case marketSell
	case massModuleStore
	case materialCollected
	case materialDiscarded
	case materialDiscovered
	case materials
	case materialTrade
	case miningRefined
	case missionAbandoned
	case missionAccepted
	case missionCompleted
	case missionFailed
	case missionRedirected
	case missions
	case moduleBuy
	case moduleBuyAndStore
	case moduleInfo
	case moduleRetrieve
	case moduleSell
	case moduleSellRemote
	case moduleStore
	case moduleSwap
	case multiSellExplorationData
	case music
	case navBeaconScan
	case navRoute
	case navRouteClear
	case newCommander
	case npcCrewPaidWage
	case npcCrewRank
	case outfitting
	case passengers
	case payBounties
	case payFines
	case payLegacyFines
	case playerKill = "PVPKill"
	case powerplay
	case powerplayCollect
	case powerplayDefect
	case powerplayDeliver
	case powerplayFastTrack
	case powerplayJoin
	case powerplayLeave
	case powerplaySalary
	case powerplayVote
	case powerplayVoucher
	case progress
	case promotion
	case prospectedAsteroid
	case quitCrew = "quitACrew"
	case rank
	case rebootRepair
	case receiveText
	case redeemVoucher
	case refuelAll
	case refuelPartial
	case renameSuitLoadout
	case repair
	case repairAll
	case repairDrone
	case reputation
	case requestPowerMicroResources
	case reservoirReplenished
	case restockVehicle
	case resupply
	case resurrect
	case scan
	case scanBaryCentre
	case scanned
	case scanOrganic
	case scientificResearch
	case screenshot
	case searchAndRescue
	case selfDestruct
	case sellDrones
	case sellExplorationData
	case sellMicroResources
	case sellOrganicData
	case sellShipOnRebuy
	case sellSuit
	case sellWeapon
	case sendText
	case setUserShipName
	case sharedBookmarkToSquadron
	case shieldState
	case shipLocker
	case shipLockerMaterials
	case shipRedeemed
	case shipTargeted
	case shipyard
	case shipyardBuy
	case shipyardNew
	case shipyardRedeem
	case shipyardSell
	case shipyardSwap
	case shipyardTransfer
	case shutdown
	case signalDiscovered = "FSSSignalDiscovered"
	case signalDrop = "USSDrop"
	case squadronCreated
	case squadronDemotion
	case squadronPromotion
	case squadronStartup
	case startJump
	case statistics
	case status
	case storedModules
	case storedShips
	case suitLoadout
	case supercruiseDestinationDrop
	case supercruiseEntry
	case supercruiseExit
	case surfaceScanComplete = "SAAScanComplete"
	case surfaceSignalsFound = "SAASignalsFound"
	case switchSuitLoadout
	case synthesis
	case systemsShutdown
	case targetSystem = "FSDTarget"
	case technologyBroker
	case touchdown
	case tradeMicroResources
	case transferMicroResources
	case underAttack
	case undocked
	case upgradeSuit
	case upgradeWeapon
	case useConsumable
	case vehicleSwitch
	case wingAdd
	case wingInvite
	case wingJoin
	case wingLeave
	case wonTrophy = "wonATrophyForSquadron"
}
