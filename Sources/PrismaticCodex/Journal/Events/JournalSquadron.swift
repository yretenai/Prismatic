// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Partial class for Squadron related events.
public class JournalSquadron: JournalEntry {
	required init(json: PrismaticJsonObject, event: JournalEvent) {
		squadronName = json["SquadronName", default: "Squadron"]

		super.init(json: json, event: event)
	}

	public let squadronName: String

	public override var description: String {
		"\(super.description), squadron: \(squadronName)"
	}
}
