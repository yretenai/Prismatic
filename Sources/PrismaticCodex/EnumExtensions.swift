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

protocol CaseInsensitiveEnum: RawRepresentable, CaseIterable {}

extension CaseInsensitiveEnum where RawValue == String {
	init?(caseInsensitiveRawValue maybeValue: RawValue?) {
		guard var value = maybeValue else {
			return nil
		}

		// lowercased is slightly faster than uppercased?
		value = value.lowercased()

		if let found = Self.allCases.first(where: { $0.rawValue.lowercased() == value }) {
			self = found
			return
		}

		return nil
	}
}
