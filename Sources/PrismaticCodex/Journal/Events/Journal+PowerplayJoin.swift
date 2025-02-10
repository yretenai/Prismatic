// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// TODO: Fill me out.
	public class PowerplayJoin: Journal {
		required init(json: PrismaticJsonObject, event: Event) {
			// todo

			super.init(json: json, event: event)
		}

		public override var description: String {
			"\(super.description)"
		}
	}
}
