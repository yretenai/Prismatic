// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Common commander-related values.
	public class Commander: Journal {
		required init(json: PrismaticJsonObject, event: Event) {
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
}
