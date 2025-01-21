// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// TODO: Fill me out
public class JournalCollectItems: JournalEntry {
	required init(json: [String: Any], event: JournalEvent) {
		// todo

		super.init(json: json, event: event)
	}

	public override var description: String {
		"\(super.description)"
	}
}