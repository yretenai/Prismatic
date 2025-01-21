// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// TODO: Fill me out.
public class JournalModuleStore: JournalEntry {
	required init(json: PrismaticJsonObject, event: JournalEvent) {
		// todo

		super.init(json: json, event: event)
	}

	public override var description: String {
		"\(super.description)"
	}
}
