// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Frontier Account Id ("F####").
public struct FrontierId: LosslessStringConvertible {
	public init(_ description: String) {
		guard description.count > 1 && description.first == "F" else {
			value = -1
			return
		}

		guard let value = Int(description[description.index(description.startIndex, offsetBy: 1)...], radix: 10) else {
			value = -1
			return
		}

		self.value = value
	}

	public init(_ id: Int) {
		value = id
	}

	public var description: String {
		"F\(value)"
	}

	public let value: Int

	public static func == (lhs: Self, rhs: Int) -> Bool {
		return lhs.value == rhs
	}
}
