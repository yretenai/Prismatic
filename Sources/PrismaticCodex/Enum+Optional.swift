// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension RawRepresentable {
	init?(rawValue maybeValue: RawValue?) {
		guard let value = maybeValue else {
			return nil
		}

		self.init(rawValue: value)
	}
}
