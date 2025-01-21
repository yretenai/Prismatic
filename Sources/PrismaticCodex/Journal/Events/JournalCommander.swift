// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Common commander-related values.
public class JournalCommander: JournalEntry {
	required init(json: PrismaticJsonObject, event: JournalEvent) {
		commanderName = json["Name", default: "Commander"]
		frontierId = FrontierId(json["FID", default: "F0"])

		super.init(json: json, event: event)
	}

	public override var description: String {
		"\(super.description), commander: \(commanderName) (\(frontierId))"
	}

	public let commanderName: String
	public let frontierId: FrontierId
}
