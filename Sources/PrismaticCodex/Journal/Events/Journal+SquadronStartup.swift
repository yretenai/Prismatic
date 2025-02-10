// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Emitted on startup.
	public class SquadronStartup: Squadron {
		required init(json: PrismaticJsonObject, event: Event) {
			rank = json["CurrentRank", default: 0]

			super.init(json: json, event: event)
		}

		public override var description: String {
			"\(super.description), rank: \(rank)"
		}

		public let rank: Int
	}
}
