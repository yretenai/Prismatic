// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Emitted when rank changes within a squadron.
public class JournalSquadronRankChange: JournalSquadron {
	required init(json: PrismaticJsonObject, event: JournalEvent) {
		oldRank = json["OldRank", default: 0]
		newRank = json["NewRank", default: 0]

		super.init(json: json, event: event)
	}

	public let oldRank: Int
	public let newRank: Int

	public override var description: String {
		"\(super.description), old rank: \(oldRank), new rank \(newRank)"
	}
}
