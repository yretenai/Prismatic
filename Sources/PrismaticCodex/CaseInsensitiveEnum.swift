// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

internal protocol CaseInsensitiveEnum: RawRepresentable, CaseIterable {}

extension CaseInsensitiveEnum where RawValue == String {
	init?(caseInsensitiveRawValue maybeValue: RawValue?) {
		guard let value = maybeValue else {
			return nil
		}

		if let found = Self.allCases.first(where: { $0.rawValue.caseInsensitiveCompare(value) == .orderedSame }) {
			self = found
		}

		return nil
	}
}
