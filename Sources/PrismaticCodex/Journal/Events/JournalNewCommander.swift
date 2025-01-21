// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Emitted when a new commander is made.
public class JournalNewCommander: JournalCommander {
	required init(json: PrismaticJsonObject, event: JournalEvent) {
		package = json["Package"]
		super.init(json: json, event: event)
	}

	public override var description: String {
		"\(super.description), package: \(package ?? "none")"
	}

	public let package: String?
}
