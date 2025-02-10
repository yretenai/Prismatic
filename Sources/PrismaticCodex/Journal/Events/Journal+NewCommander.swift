// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Emitted when a new commander is made.
	public class NewCommander: Commander {
		required init(json: PrismaticJsonObject, event: Event) {
			package = json["Package"]
			super.init(json: json, event: event)
		}

		public override var description: String {
			"\(super.description), package: \(package ?? "none")"
		}

		public let package: String?
	}
}
