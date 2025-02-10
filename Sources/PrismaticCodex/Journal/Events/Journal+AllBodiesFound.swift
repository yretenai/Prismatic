// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// Emitted when all bodies in the system are identified.
	public class AllBodiesFound: Journal, SystemRelatedEvent {
		required init(json: PrismaticJsonObject, event: Event) {
			systemName = json["SystemName"]
			systemAddress = json["SystemAddress"]
			count = json["Count", default: 0]

			super.init(json: json, event: event)
		}

		public override var description: String {
			"\(super.description), system name: \(systemName ?? "nil"), address: \(systemAddress ?? 0), body count: \(count)"
		}

		public let systemName: String?
		public let systemAddress: UInt?
		public let count: Int
	}
}
