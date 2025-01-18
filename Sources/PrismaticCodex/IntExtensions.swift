// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Int {
	init?<S>(_ text: S?, radix: Int = 10) where S: StringProtocol {
		guard let text = text else {
			return nil
		}

		self.init(text, radix: radix)
	}
}
